enum T {
  Empty
  Node (T, T, Int, Int, Int)
}

func ls(self: T) -> T {
  match self {
    Empty => Empty
    Node(x, _, _, _, _) => x
  }
}

func rs(self: T) -> T {
  match self {
    Empty => Empty
    Node(_, x, _, _, _) => x
  }
}

func l(self: T) -> Int {
  match self {
    Empty => 0
    Node(_, _, x, _, _) => x
  }
}

func r(self: T) -> Int {
  match self {
    Empty => 0
    Node(_, _, _, x, _) => x
  }
}

func v(self: T) -> Int {
  match self {
    Empty => 0
    Node(_, _, _, _, x) => x
  }
}

func max(x: Int, y: Int) -> Int {
  var u = x
  if y > x {
    u = y
  }
  u
}

// func pushup(self: T) {
//   match self {
//     Node(ls, rs, _, _, x) => {
//       x = max(ls.v(), rs.v())
//     }
//   }
// }



func bd(l: Int, r: Int) -> T{
  var v: T = Empty
  if l != r {
    let mid = (l + r) / 2
    v = Node( bd(l, mid), bd(mid + 1, r), l, r, 0 )
  } else {
    v = Node( Empty, Empty, l, r, 0 )
  }
  v
}

// x -> y
func chg(u: T, x: Int, y: Int) -> T {
  var v: T = Empty
  let l = u.l()
  let r = u.r()
  if l != r {
    let mid = (l + r) / 2
    if x <= mid {
      let left = chg(u.ls(), x, y)
      v = Node(left, u.rs(), l, r, max(left.v(), u.rs().v()) )
    } else {
      let right:T = chg(u.rs(), x, y)
      v = Node( u.ls(), right, l, r, max(u.ls().v(), right.v()) )
    }
  } else {
    v = Node( Empty, Empty, l, r, y )
  }
  v
}

func qry(u: T, x: Int, y: Int) -> Int {
    let l = u.l()
    let r = u.r()
    let mid = (l + r) / 2
    var ret = 0
    if x <= l && r <= y {
      ret = u.v()
    } else {
      if x <= mid {
        ret = max(ret, qry(u.ls(), x, y))
      } else {
        ret = max(ret, qry(u.rs(), x, y))
      } 
    }
    ret
}

func init {
  let num = 5
  var u = bd(1, num)
  u = chg(u, 3, 4)
  println(qry(u, 1, 5))
}

