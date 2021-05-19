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
  const { texture, name, x, y, z } = props;

  return (
    <sprite position={[x, y, z]} >
      <spriteMaterial attach="material" map={texture} color={"gray"} />
    </sprite>
  );
};

export default System;
