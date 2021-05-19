import * as React from "react";
import SystemTooltip from "maps/system_tooltip";
import { Texture } from "three";

interface SystemProps {
  texture: Texture;
  name: string;
  x: number;
  y: number;
  z: number;
  onClick: Function;
}

const System: React.FC<SystemProps> = (props) => {
  const { texture, name, x, y, z, onClick } = props;

  const [isSelected, setIsSelected] = React.useState(false);

  return (
    // <mesh
    //   position={[x, y, z]}
    //   onClick={(e) => setIsSelected(!isSelected) }
    // >
    //   <sphereGeometry args={[0.1, 5, 5]}/>
    //   <meshStandardMaterial color={isSelected ? "white" : "gray"} />
    //   { isSelected && <SystemTooltip name={name} />}
    // </mesh>

    <sprite
      position={[x, y, z]}
      onClick={(e) => setIsSelected(!isSelected) }
    >
      <spriteMaterial attach="material" map={texture} color={isSelected ? "white" : "gray"} />
      { isSelected && <SystemTooltip name={name} />}
    </sprite>
  );
};

export default System;
