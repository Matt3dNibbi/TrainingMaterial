#include <QtGui/QApplication>
#include <QtGui/QMainWindow>

#include <windows.h>
#include <stdio.h>
#include <fcntl.h>
#include <io.h>
#include <iostream>
#include <fstream>

#include <DFGWrapper/DFGWrapper.h>
#include <DFG/DFGCombinedWidget.h>

using namespace FabricServices;
using namespace FabricUI;

class MyDFGWidget : public DFG::DFGCombinedWidget
{
public:

  MyDFGWidget(QWidget * parent)
  : DFGCombinedWidget(parent)
  {

  }

  virtual void onRecompilation()
  {
    log(0, "Recompiling", 12);
  }

  static void log(void * userData, const char * message, unsigned int length)
  {
    printf("%s\n", message);
  }
};

struct WindowData
{
  QApplication * qtApp;
  QMainWindow * qtMainWindow;
  MyDFGWidget * qtDFGWidget;
  FabricCore::Client * client;
  FabricServices::ASTWrapper::KLASTManager * manager;
  FabricServices::DFGWrapper::Host * host;
  FabricServices::DFGWrapper::Binding binding;
  FabricServices::DFGWrapper::GraphExecutablePtr graph;
  FabricServices::Commands::CommandStack stack;
};

WindowData * g_windowData = NULL;
const char g_szClassName[] = "NonQtApp";

void openCanvasUI(HWND hwnd)
{
  if(g_windowData->qtApp == NULL)
  {
    int argv = 0;
    g_windowData->qtApp = new QApplication(argv, NULL);
    g_windowData->qtMainWindow = new QMainWindow();
    g_windowData->qtDFGWidget = new MyDFGWidget(g_windowData->qtMainWindow);
    g_windowData->qtMainWindow->setCentralWidget(g_windowData->qtDFGWidget);
    g_windowData->qtDFGWidget->init(
      g_windowData->client,
      g_windowData->manager,
      g_windowData->host,
      g_windowData->binding,
      g_windowData->graph,
      &g_windowData->stack
    );
  }

  if(!g_windowData->qtMainWindow->isVisible())
  {
    g_windowData->qtMainWindow->show();
    while(g_windowData->qtMainWindow->isVisible())
    {
      g_windowData->qtApp->processEvents();
    }
  }
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
  switch(msg)
  {
    case WM_CLOSE:
    {
      // g_qtMainWindow->close();
      if(g_windowData->host)
        delete(g_windowData->host);
      if(g_windowData->client)
        delete(g_windowData->client);
      if(g_windowData->qtApp)
        delete(g_windowData->qtApp);
      delete(g_windowData);
      DestroyWindow(hwnd);
    }
    break;
    case WM_DESTROY:
    {
      PostQuitMessage(0);
      break;
    }
    case WM_COMMAND:
     if (HIWORD(wParam) == BN_CLICKED)
     {
        openCanvasUI(hwnd);
        // PostQuitMessage(0);
        break;
     }
    default:
      return DefWindowProc(hwnd, msg, wParam, lParam);
  }
  return 0;
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
    LPSTR lpCmdLine, int nCmdShow)
{
  WNDCLASSEX wc;
  HWND hwnd;
  MSG Msg;

  //Step 1: Registering the Window Class
  wc.cbSize        = sizeof(WNDCLASSEX);
  wc.style         = 0;
  wc.lpfnWndProc   = WndProc;
  wc.cbClsExtra    = 0;
  wc.cbWndExtra    = 0;
  wc.hInstance     = hInstance;
  wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION);
  wc.hCursor       = LoadCursor(NULL, IDC_ARROW);
  wc.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
  wc.lpszMenuName  = NULL;
  wc.lpszClassName = g_szClassName;
  wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION);

  if(!RegisterClassEx(&wc))
  {
    MessageBox(NULL, "Window Registration Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
    return 0;
  }

  // Step 2: Creating the Window
  hwnd = CreateWindowEx(
    WS_EX_CLIENTEDGE,
    g_szClassName,
    "NonQtApp",
    WS_OVERLAPPEDWINDOW,
    CW_USEDEFAULT,
    CW_USEDEFAULT,
    130,
    150,
    NULL,
    NULL,
    hInstance,
    NULL
  );

  if(hwnd == NULL)
  {
    MessageBox(NULL, "Window Creation Failed!", "Error!", MB_ICONEXCLAMATION | MB_OK);
    return 0;
  }
  else
  {
    CreateWindow(
      TEXT("button"),
      TEXT("Canvas UI"),       
      WS_VISIBLE | WS_CHILD,  
      10,
      10,
      100,
      100,        
      hwnd,
      (HMENU) 1,
      NULL,
      NULL
    );        
  }

  g_windowData = new WindowData();
  g_windowData->qtApp = NULL;
  g_windowData->qtMainWindow = NULL;
  g_windowData->client = NULL;
  g_windowData->manager = NULL;
  g_windowData->host = NULL;


  // create the Fabric Client, a graph, etc....
  try
  {
    // create a client
    FabricCore::Client::CreateOptions options;
    memset( &options, 0, sizeof( options ) );
    options.optimizationType = FabricCore::ClientOptimizationType_Background;
    g_windowData->client = new FabricCore::Client(&MyDFGWidget::log, NULL, &options);

    // create a host for Canvas
    g_windowData->host = new DFGWrapper::Host(*g_windowData->client);

    g_windowData->binding = g_windowData->host->createBindingToNewGraph();
    g_windowData->graph = DFGWrapper::GraphExecutablePtr::StaticCast(g_windowData->binding.getExecutable());

    // add a report node
    DFGWrapper::NodePtr reportNode = g_windowData->graph->addNodeFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    g_windowData->graph->addPort("caption", FabricCore::DFGPortType_In);
    g_windowData->graph->addPort("result", FabricCore::DFGPortType_Out);

    // connect things up
    g_windowData->graph->getPort("caption")->connectTo(reportNode->getPort("value"));
    reportNode->getPort("value")->connectTo(g_windowData->graph->getPort("result"));

    // setup the values to perform on
    FabricCore::RTVal value = FabricCore::RTVal::ConstructString(*g_windowData->client, "test test test");
    g_windowData->binding.setArgValue("result", value);
    g_windowData->binding.setArgValue("caption", value);
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  ShowWindow(hwnd, nCmdShow);
  UpdateWindow(hwnd);

  // Step 3: The Message Loop
  while(GetMessage(&Msg, NULL, 0, 0) > 0)
  {
    TranslateMessage(&Msg);
    DispatchMessage(&Msg);
  }
  return Msg.wParam;
}

int main() {
  return WinMain(GetModuleHandle(NULL), NULL, GetCommandLine(), SW_SHOW);
}
