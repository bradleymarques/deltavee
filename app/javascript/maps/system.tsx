import * as React from "react";

interface SystemProps {
  name: string;
  x: number;
  y: number;
  z: number;
}

const System: React.FC<SystemProps> = (props) => {
  const { name, x, y, z } = props;

  return (
    <mesh position={[x, y, z]}>
      <sphereGeometry args={[0.1, 10, 10]}/>
    </mesh>
  );
};

export default System;
