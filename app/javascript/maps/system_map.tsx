import * as React from "react";
import { Canvas } from "@react-three/fiber";

import CameraController from "maps/camera_controller";
import System from "maps/system";

interface SystemMapProps {
  url: string;
}

interface SystemDatum {
  name: string;
  x: number;
  y: number;
  z: number;
}

const SystemMap: React.FC<SystemMapProps> = (props) => {
  const { url } = props;
  const [error, setError] = React.useState(null);
  const [isLoaded, setIsLoaded] = React.useState(false);
  const [systemData, setSystemData] = React.useState([]);

  React.useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(
        (result) => {
          setIsLoaded(true);
          setSystemData(result.system_data);
        },
        (error) => {
          setIsLoaded(true);
          setError(error);
        }
      )
  }, [url])

  if (error) {
    return <div>Error: {error.message}</div>
  } else if (!isLoaded) {
    return <div>Loading...</div>
  } else {
    return (
      <Canvas>
        <CameraController />
        <ambientLight />
          {systemData.map((systemDatum: SystemDatum) => {
            return <System key = {systemDatum.name} {...systemDatum} />
          })}
      </Canvas>
    );
  }
};

export default SystemMap;
