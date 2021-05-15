import * as React from "react";

interface Props {
  x: number;
  y: number;
  z: number;
};

const System: React.FC<Props> = (props) => {
  const { x, y, z } = props;

  return(
    <mesh position={[x,y,z]}>
      <sphereGeometry args={[0.1, 10, 10]}/>
    </mesh>
  )
};

export default System;
