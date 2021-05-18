import * as React from "react";
import { Html } from "@react-three/drei";

interface SystemTooltipProps {
  name: string;
}

const SystemTooltip: React.FC<SystemTooltipProps> = (props) => {
  const { name } = props;

  return (
    <Html>
      <div className="card bg-dark system-map-card">
        <div className="card-body">
          <h4 className="card-title">{name}</h4>
          <button className="btn btn-primary">Button</button>
        </div>
      </div>
    </Html>
  );
}

export default SystemTooltip;
