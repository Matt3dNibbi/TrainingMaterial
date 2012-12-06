var CreationPlatform = {};

$(function() {
  CreationPlatform.createClient = function(viewportSizeFactor) {
    var client = {};

    client.options = {};
    client.options.enableCompression = false;
    //client.options.enableFrameDiffs = true;
    //client.options.jpegQuality = 50;

    if(viewportSizeFactor == undefined)
      viewportSizeFactor = 0.5

    client.viewports = {};
    client.viewport = undefined;

    client.connected = false;
    client.pending = [];
    client.responseRecieved = true;

    client.sendMessage = function( cmd, data, enqueIfBlocked ) {
      var message = { 'cmd': cmd, 'data': data };
      if (client.connected){
        if(client.responseRecieved){
          client.socket.send(JSON.stringify(message));
          client.responseRecieved = false;
        }else{
          if(enqueIfBlocked==true){
            client.pending.push(JSON.stringify(message));
          }
        }
      }
      else
        client.pending.push(JSON.stringify(message));
    };

    client.pub = {};
    client.pub.connect = function(host, container) {
      client.container = container;
      client.socket = new WebSocket(host);

      client.socket.onopen = function(e) {
        console.log("Websocket connection opened");
        client.connected = true;
        for (m in client.pending) {
          client.socket.send(client.pending[m]);
        }
        client.pending = [];
      };

      client.socket.onclose = function(e) {
        console.log("Websocket connection closed");
      };

      client.socket.onmessage = function(e) {
        try {
          if (client.options.enableCompression) {
            var reader = new FileReader();
            reader.readAsArrayBuffer(e.data);
            reader.onloadend = function() {
              var a = new Uint8Array(this.result);
              var unzipped = (new JXG.Util.Unzip(a)).unzip()[0][0];
              var message = JSON.parse(unzipped);
              client.handlers[message.cmd](message.data);
            };
          }
          else {
            var message = JSON.parse(e.data);
            client.handlers[message.cmd](message.data);
          }
        }
        catch (e) {
          console.log("Error handling message: "+e);
        }
        client.responseRecieved = true;

        // Send any pending messages
        for (m in client.pending) {
          client.socket.send(client.pending[m]);
        }
        client.pending = [];
      };
    };

    client.pub.addViewport = function(name) {
      return client.createViewport(name)
    };

    client.createViewport = function(name) {
      var viewport = {};
      var initialWiewportWidth
      var initialWiewportHeight
      viewport.create = function(name) {
        viewport.jq = $('<canvas/>');
        viewport.dom = viewport.jq.get(0);
        viewport.id = name;
        viewport.context = viewport.dom.getContext('2d');

        viewport.diff = {};
        viewport.diff.jq = $('<canvas/>');
        viewport.diff.dom = viewport.diff.jq.get(0);
        viewport.diff.context = viewport.diff.dom.getContext('2d');

        viewport.bindEvents();

        viewport.diff.jq.hide();
        client.container.append(viewport.jq);
        client.container.append(viewport.diff.jq);


        initialWiewportWidth = $('#viewports').width()
        initialWiewportHeight = $('#viewports').height()
        data = {
          'width': Math.round(initialWiewportWidth*viewportSizeFactor),
          'height': Math.round(initialWiewportHeight*viewportSizeFactor),
          'id': name
        };
        client.sendMessage('createViewport', data, true);
      };

      
      viewport.sendMessage = function(eventName, data) {
        data['viewport'] = viewport.id,
        client.sendMessage(eventName, data, true);
      }

      viewport.bindEvents = function() {

        sendMouseEvent = function(cmd, e, enqueIfBlocked) {
          posX = (e.clientX - viewport.jq.position().left)*viewportSizeFactor
          posY = (e.clientY - viewport.jq.position().top)*viewportSizeFactor
          width = $('#viewports').width()
          height = $('#viewports').height()
          data = {
            'viewport': viewport.id,
            'x': posX * (initialWiewportWidth/width),
            'y': posY * (initialWiewportHeight/height)
          };

          if ( 'button' in e ) {
            // [andrew 2012-09-11] CP using Qt button values internally
            var qtButton = 0;
            switch (e.button) {
              case 0: // left
                qtButton = 1;
                break;
              case 1: // middle
                qtButton = 4;
                break;
              case 2: // right
                qtButton = 2;
                break;
            }
            data.mouseButton = qtButton;
          }
          client.sendMessage(cmd, data, enqueIfBlocked);
        };

        //////////////////////////
        // Mouse
        var lastMove = 0;
        viewport.jq.mousedown(function(event) {
          sendMouseEvent('mousePressEvent', event, true);
          lastMove = 0;
        });

        viewport.jq.mouseup(function(event) {
          sendMouseEvent('mouseReleaseEvent', event, true);
          lastMove = 0;
        });

        viewport.jq.mouseout(function(event) {
          sendMouseEvent('mouseReleaseEvent', event, true);
          lastMove = 0;
        });

        viewport.jq.mousemove(function(event) {
          sendMouseEvent('mouseMoveEvent', event);
        });

        // [andrew 2012-09-11] disable changing cursor type in viewport
        viewport.dom.onselectstart = function(){ return false; }

       
        // Mouse Wheel

        // Chrome
        viewport.dom.addEventListener('mousewheel', function (e) {
          data = {
            'viewport': viewport.id,
            'wheelDelta': e.wheelDelta
          };
          client.sendMessage('wheelEvent', data, true);
          e.preventDefault(); // don't scroll the window
        }, false);

        // Firefox
        viewport.dom.addEventListener('DOMMouseScroll', function (e) {
          data = {
            'viewport': viewport.id,
            // use Chrome-equivalent value for wheel movement
            'wheelDelta': e.detail * -40
          };
          client.sendMessage('wheelEvent', data);
          e.preventDefault(); // don't scroll the window
        }, false);

        //////////////////////////
        // Keyboard
        // [andrew 2012-09-11] doesn't seem possible to bind to keydown()
        // per canvas, FIXME for multi-viewport
        $(document).keydown(function(event) {
          data = {
            'viewport': viewport.id,
            'key': event['keyCode']
          }
          client.sendMessage('keyPressEvent', data, true);
        });
        $(document).keyup(function(event) {
          data = {
            'viewport': viewport.id,
            'key': event['keyCode']
          }
          client.sendMessage('keyReleaseEvent', data, true);
        });

        //////////////////////////
        // Viewport
        var resizeViewport = function(event){
          width = $('#viewports').width()
          height = $('#viewports').height()

          // browser seems to send redundant resize events
          if (width == viewport.width && height == viewport.height)
            return;

          viewport.width = width;
          viewport.height = height;
          viewport.jq.width(width)
          viewport.jq.height(height)
          viewport.diff.jq.width(width)
          viewport.diff.jq.height(height)

          // ignore any explicit calls to resizeViewport()
          if ( event !== undefined )
          {
            viewport.sendMessage(
              'surfaceResizeEvent',
              {
                'width': Math.round(width*viewportSizeFactor),
                'height': Math.round(height*viewportSizeFactor)
              }
            );
          }
        }
        resizeViewport();
        $(window).resize(resizeViewport);
      };


      viewport.resize = function(width, height) {
        viewport.width = width;
        viewport.height = height;
        viewport.jq.prop('width', width);
        viewport.jq.prop('height', height);
      };


      viewport.applyDiff = function() {
        var vpimage = viewport.context.getImageData(0, 0, viewport.width, viewport.height);
        var diffimage = viewport.diff.context.getImageData(0, 0, viewport.width, viewport.height);
        for (var i=0; i<vpimage.data.length; i+=4) {
          // skip alpha channel (RGBA)
          for (var j=0; j<3; j++) {
            vpimage.data[i+j] = vpimage.data[i+j] ^ diffimage.data[i+j];
          }
        }
        viewport.context.putImageData(vpimage, 0, 0);
      };

      viewport.pub = {};
      viewport.pub.receiveFrame = function(data) {
        var frame = new Image();
        if (data.image != undefined) {
          frame.src = 'data:image/'+data.type+';base64,'+data.image;
          frame.onload = function() {
            viewport.resize(frame.width, frame.height);
            viewport.context.drawImage(frame, 0, 0);
          };
        }
        else {
          frame.src = 'data:image/'+data.difftype+';base64,'+data.diff;
          frame.onload = function() {
            viewport.diff.jq.prop('width', frame.width);
            viewport.diff.jq.prop('height', frame.height);
            viewport.diff.context.drawImage(frame, 0, 0);
            viewport.applyDiff();
          };
        }
      };
      viewport.pub.sendMessage = function(eventName, dat) {
        viewport.sendMessage(eventName, data, true)
      }

      viewport.create(name);

      client.viewports[name] = viewport.pub;

      return viewport.pub;
    };

    client.pub.sendMessage = function(name, data) {
      client.sendMessage(name, data, true);
    };

    client.handlers = {}
    client.handlers.viewport = function(data) {
      var id = data.viewport;
      console.log(id);
      //client.viewports[id] = client.createViewport(data.viewport);
    };
    client.handlers.frame = function(data) {
      var viewport = client.viewports[data.viewport];
      viewport.receiveFrame(data);
    }

    client.handlers.response = function(data) {
      //console.log(data)
    }

    return client.pub;
  };
});
