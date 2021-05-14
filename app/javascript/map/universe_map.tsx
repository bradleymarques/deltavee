import * as React from "react";
import { Canvas, useFrame } from '@react-three/fiber'
import { OrbitControls } from "map/orbit_controls";

interface Props {};

const UniverseMap: React.FC<Props> = (props) => {
  return(
    <Canvas>
      <mesh position={[0,0,0]}>
        <sphereGeometry args={[1, 5, 5]}/>
      </mesh>

      <mesh position={[2,2,2]}>
        <sphereGeometry args={[1, 5, 5]}/>
      </mesh>

      <mesh position={[10,10,10]}>
        <sphereGeometry args={[1, 5, 5]}/>
      </mesh>

      <ambientLight intensity={1} />
      <OrbitControls />
    </Canvas>
  );
};

export default UniverseMap;
