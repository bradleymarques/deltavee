import * as React from "react";

interface SystemProps {
  name: string;
  x: number;
  y: number;
  z: number;
}

const System: React.FC<SystemProps> = (props) => {
  const { name, x, y, z } = props;

  const mesh = React.useRef();

  const [hovered, setHovered] = React.useState(false);

  return (
    <mesh
      ref={mesh}
      position={[x, y, z]}
      onPointerOver={(event) => setHovered(true)}
      onPointerOut={(event) => setHovered(false)}>
      <sphereGeometry args={[0.1, 10, 10]}/>
      <meshStandardMaterial color={ hovered ? 'green' : 'white' } />
    </mesh>
  );
};

export default System;
