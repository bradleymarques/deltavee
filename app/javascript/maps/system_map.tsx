import * as React from "react";

interface SystemMapProps {
  url: string;
}

const SystemMap: React.FC<SystemMapProps> = (props) => {
  const { url } = props;

  return <p>This is a map</p>
};

export default SystemMap;
