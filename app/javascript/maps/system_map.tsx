import * as React from "react";

interface SystemMapProps {
  url: string;
}

const SystemMap: React.FC<SystemMapProps> = (props) => {
  const { url } = props;
  const [error, setError] = React.useState(null);
  const [isLoaded, setIsLoaded] = React.useState(false);
  const [systems, setSystems] = React.useState([]);

  React.useEffect(() => {
    fetch(url)
      .then(res => res.json())
      .then(
        (result) => {
          setIsLoaded(true);
          setSystems(result.systems);
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
      <ul>
        {systems.map(system => { return <li key={system.id}>{system.name}</li> })}
      </ul>
    );
  }
};

export default SystemMap;
