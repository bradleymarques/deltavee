import * as React from "react";
import { Canvas, useThree } from "@react-three/fiber";

import System from "maps/system";
import CameraController from "maps/camera_controller";

interface SystemMapProps {
  url: string;
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
          {systemData.map(systemDatum => {
            return <System key={systemDatum.id} {...systemDatum} />;
          })}
      </Canvas>
    );
  }
};

export default SystemMap;
