import * as React from "react";
import { Canvas } from "@react-three/fiber";
import { Stats } from "@react-three/drei";

import SystemMapController from "maps/system_map_controller";

interface SystemMapProps {
  url: string;
}

const SystemMap: React.FC<SystemMapProps> = (props) => {
  const { url } = props;

  return (
    <Canvas>
      <SystemMapController url={url} />
      <Stats />
    </Canvas>
  );
};

export default SystemMap;
