import * as React from "react";
import { useThree } from "@react-three/fiber";
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';

const CameraController = () => {
  const { camera, gl } = useThree();
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
