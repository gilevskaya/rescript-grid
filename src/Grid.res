export type tFixed =
  | Row(int, string)
  | Column(int, string)

module Item = {
  @react.component
  export make = (
    ~x: option<int>=?,
    ~y: option<int>=?,
    ~w: option<int>=?,
    ~h: option<int>=?,
    ~children,
  ) => {
    let columnStart = switch x {
    | Some(v) => (v + 1)->Js.Int.toString
    | None => ""
    }
    let rowStart = switch y {
    | Some(v) => Js.Int.toString(v + 1)
    | None => ""
    }
    let columnEnd = switch w {
    | Some(v) => v->Js.Int.toString
    | None => "1"
    }
    let rowEnd = switch h {
    | Some(v) => v->Js.Int.toString
    | None => "1"
    }
    <div
      style={ReactDOM.Style.make(
        ~height="100%",
        ~width="100%",
        ~overflow="hidden",
        ~position="relative",
        ~gridRowStart={rowStart},
        ~gridColumnStart={columnStart},
        ~gridRowEnd=`span ${rowEnd}`,
        ~gridColumnEnd=`span ${columnEnd}`,
        (),
      )}>
      {children}
    </div>
  }
}

open Js.Array2

@react.component
export make = (
  ~rows: int=1,
  ~columns: int=1,
  ~gap: string="",
  ~fixed: array<tFixed>=[],
  ~children,
) => {
  let (gridRows, gridColumns) = {
    let gr = []
    let gc = []
    for _ in 1 to rows {
      let _ = gr->push("1fr")
    }
    for _ in 1 to columns {
      let _ = gc->push("1fr")
    }

    for i in 0 to fixed->length - 1 {
      let fixedItem = fixed[i]
      switch fixedItem {
      | Row(i, s) =>
        if i < rows {
          gr[i] = s
        }
      | Column(i, s) =>
        if i < columns {
          gc[i] = s
        }
      }
    }
    (gr->joinWith(" "), gc->joinWith(" "))
  }

  <div
    style={ReactDOM.Style.make(
      ~height="100%",
      ~width="100%",
      ~display="grid",
      ~gridGap=gap,
      ~gridTemplateRows=gridRows,
      ~gridTemplateColumns=gridColumns,
      (),
    )}>
    {children}
  </div>
}
