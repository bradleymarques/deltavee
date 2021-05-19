import * as React from "react";
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { Camera, WebGLRenderer } from "three";

interface CameraControllerProps {
  camera: Camera;
  gl: WebGLRenderer;
}

const CameraController: React.FC<CameraControllerProps> = (props) => {
  const { camera, gl } = props;

  React.useEffect(
    () => {
      const controls = new OrbitControls(camera, gl.domElement);

      controls.minDistance = 1;
      controls.maxDistance = 100;
      controls.enablePan = false;

      return () => {
        controls.dispose();
      };
    },
    [camera, gl]
  );
  return null;
};

export default CameraController;
