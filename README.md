# ReScript React CSS Grid Wrapper

React compound component that wraps css grid.
Supports fixed columns / rows.
No dependencies.

API example: https://rescript-grid.vercel.app/

## Install

```bash
yarn add rescript-grid
```

Add to bsconfig.json "bs-dependencies"

```
"bs-dependencies": [
  "reason-react",
  "rescript-grid"
]
```

## Usage with ReScript

```re
@react.component
let make = () => {
  <div style={ReactDOM.Style.make(~height="100vh", ())}>
    // default columns=1, rows=1
    // gap and fixed are optional
    <Grid columns={12} rows={12} gap="10px" fixed={[Grid.Row(0, "70px")]}>
      // no x or y - defaults to auto position
      // default w=1 h=1
      <Grid.Item w={12} h={1}>
        <div
          style={ReactDOM.Style.make(~padding="10px", ~background="Turquoise", ~height="100%", ())}>
          {"Menu"->React.string}
        </div>
      </Grid.Item>
      <Grid.Item y={1} w={5} h={4}>
        <div
          style={ReactDOM.Style.make(
            ~padding="10px",
            ~background="LightSkyBlue",
            ~height="100%",
            (),
          )}>
          {"Component A"->React.string}
        </div>
      </Grid.Item>
      <Grid.Item y={5} w={5} h={7}>
        <div
          style={ReactDOM.Style.make(
            ~padding="10px",
            ~background="LightGreen",
            ~height="100%",
            ~overflowY="auto",
            (),
          )}>
          {"Component B "->Js.String2.repeat(1000)->React.string}
        </div>
      </Grid.Item>
      <Grid.Item x={5} y={1} w={7} h={11}>
        <div
          style={ReactDOM.Style.make(~padding="10px", ~background="LightGray", ~height="100%", ())}>
          {"Component C"->React.string}
        </div>
      </Grid.Item>
    </Grid>
  </div>
}
```

## Contribute

If you have a bug to report or a feature request, please add it as an issue or make a pull request.

## License

MIT © [gilevskaya](https://github.com/gilevskaya/rescript-grid)
