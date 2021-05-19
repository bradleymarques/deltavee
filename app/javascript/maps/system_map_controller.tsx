import * as React from "react";
import { useThree } from "@react-three/fiber";
import { TextureLoader } from "three";

import CameraController from "maps/camera_controller";
import System from "maps/system";
import StarImage from "../images/star.png";

interface SystemMapProps {
  url: string;
}

interface SystemDatum {
  name: string;
  x: number;
  y: number;
  z: number;
}

const SystemMapController: React.FC<SystemMapProps> = (props) => {
  const { url } = props;
  const [systemData, setSystemData] = React.useState([]);

  const { camera, gl } = useThree();

  const loader = new TextureLoader();
  const texture = loader.load(StarImage);

  React.useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(
        (result) => {
          setSystemData(result.system_data);
        },
        (error) => {
          console.error(error);
        }
      )
  }, [url])

  return (
    <group>
      <CameraController camera={camera} gl={gl} />
      {systemData.map((systemDatum: SystemDatum) => {
        return <System key={systemDatum.name} texture={texture} {...systemDatum} />
      })}
    </group>
  );
};

export default SystemMapController;
