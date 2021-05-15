import * as React from "react";
import Plot from 'react-plotly.js';

interface UniverseMapProps {
  url: string
};

interface Response {
  name: Array<string>;
  x: Array<number>;
  y: Array<number>;
  z: Array<number>;
  absolute_magnitude: Array<number>;
}

const UniverseMap: React.FC<UniverseMapProps> = (props) => {
  const { url } = props;

  const [data, setData] = React.useState([]);
  const [isLoading, setIsLoading] = React.useState(true);

  const parseResponse = (response: Response) => {
    const newData = [{
      x: response.x,
      y: response.y,
      z: response.z,
      text: response.name,
      type: "scatter3d",
      mode: "markers",
      marker: {
        color: response.absolute_magnitude,
        size: response.absolute_magnitude,
        opacity: 0.75,
        line: {
          color: "white",
          width: 2
        }
      }
    }];

    setData(newData);

    console.log(data);
  }

  React.useEffect(() => {
    if (!isLoading) return

    fetch(url, { method: "GET" })
      .then(res => res.json())
      .then(response => {
        parseResponse(response)
        setIsLoading(false);
      })
      .catch(error => console.error(error));
  }, [isLoading, data]);

  const layout = {
    autosize: true,
    paper_bgcolor: "rgba(0,0,0,0)",
    plot_bgcolor: "rgba(0,0,0,0)",
  }

  const style = { width: "100%", height: "100%" }

  return (
    <div className="w-100 h-100">
      { isLoading && <h1>Loading...</h1>}
      { !isLoading &&
        <Plot
          data={data}
          layout={layout}
          useResizeHandler={true}
          style={style}
        />}
    </div>
  );
};

export default UniverseMap;
