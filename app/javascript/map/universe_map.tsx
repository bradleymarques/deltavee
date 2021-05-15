import * as React from "react";
import { Canvas } from '@react-three/fiber'
import { OrbitControls } from "map/orbit_controls";
import System from "map/system";

interface Props {};

interface SystemData {
  name: string;
  x: number;
  y: number;
  z: number;
}

interface Systems {
  systems: Array<SystemData>;
}

interface Meta {
  total: number;
  per_page: number;
  page: number;
}

interface SystemsResponse {
  data: Systems;
  meta: Meta;
};

const UniverseMap: React.FC<Props> = (props) => {
  const [isLoading, setIsLoading] = React.useState(true);
  const [systems, setSystems] = React.useState([]);

  const parseResponse = (response: SystemsResponse) => {
    response.data.systems.forEach((systemData, index) => {
      const newSystem = <System key={`system_${index}`} {...systemData} />;
      setSystems(systems => [...systems, newSystem]);
    });
  }

  React.useEffect(() => {
    if (!isLoading) return;

    fetch(
      "http://localhost:3000/systems.json",
      {
        method: "GET",
      }
    )
      .then(res => res.json())
      .then(response => {
        parseResponse(response);
        setIsLoading(false);
      })
      .catch(error => console.error(error));
  }, [isLoading]);

  return(
    <div className="w-100 h-100">
      {isLoading && <h1>Loading...</h1>}
      <Canvas>
        {systems}
        <ambientLight intensity={1} />
        <OrbitControls />
      </Canvas>
    </div>

  );
};

export default UniverseMap;
