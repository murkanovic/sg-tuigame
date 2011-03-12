package ee.tmd.sg {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import org.tuio.TuioClient;
	import org.tuio.connectors.TCPConnector;
	import org.tuio.TuioManager;
	import org.tuio.TuioEvent;
	import flash.events.TouchEvent;
	import org.tuio.ITuioListener;
	import org.tuio.TuioObject;
	import org.tuio.TuioCursor;
	import flash.utils.Timer;
	import org.tuio.TuioBlob;
	import org.tuio.debug.TuioDebug;
	import org.tuio.fiducial.*;
	import org.tuio.TuioObject;
	import flash.events.Event;
	import flash.net.LocalConnection;
	import org.tuio.connectors.LCConnector;
 
	public class Engine extends MovieClip {
 
		public function Engine() {
			var tc:TuioClient = new TuioClient(new LCConnector());
			var tm:TuioManager = TuioManager.init(stage, tc);
			tc.addListener(TuioDebug.init(stage));
			tm.addEventListener(TuioEvent.ADD, addHandler);
			
		}
		
		public function addHandler(e:TuioEvent):void {
			var player1:Player = new Player();			
			stage.addChild(player1);
			var tuioObject = e.tuioContainer as TuioObject;
			trace(tuioObject.classID);
			player1.x = e.tuioContainer.x * stage.stageWidth;
			player1.y = e.tuioContainer.y * stage.stageHeight;
			
		}
 
	}
	
}