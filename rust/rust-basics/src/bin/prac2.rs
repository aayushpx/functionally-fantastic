fn main() {
    
    // Structs 
    // - group related values
    // - similar to tuples but fields have names

    struct Point { x: i32, y: i32 }
    let p = Point { x: 2, y: 2 };
    println!("{}", p.x);

    // tuple struct, type is names but fields are unnamed
    struct Point1(i32, i32);
    let p1 = Point1(3, 5);
    println!("{}", p1.0);

    // Methods (associated functions)
    // defined in impl structname { ... } environment
    // methods take first argument self

    impl Point {
        fn dist(&self, x: i32, y: i32) -> f32 { // associated func dist
            let dx = (self.x - x) as f32;
            let dy = (self.y - y) as f32;
            return (dx*dx + dy*dy).sqrt();
        }
    }

    println!("{}", p.dist(0, 0)); // value.method syntax

    // associated functions that do not have self
    impl Point {
        fn new(x: i32, y:i32) -> Self {
            return Point { x, y };
        }
    }

    let p = Point::new(3, 5);


    // Vectors 
    // dynamic size, can create useing vec! macro
    let a: Vec<i32> = vec![3, 1, 4, 1, 5];
    let mut b: Vec<i32> = Vec::new();
    for x in [3, 1, 4, 1, 5] {
        b.push(x);
    }
    for x in 0..5 {
        println!("a[{0}]={1}, b[{0}]={2}",
            x, a[x], b[x]);
    }


    // Strings 
    // UTF-8 encoding, Vec<u8>
    // String literals are slices - character sequences
    let slice: &str = "foo";
    let mut s: String = String::from(slice);
    s += "bar";
    println!("{} ", &s[1..]);


    // Hash Tables
    // HashMap<K,V> needs to be imported:
    // `use std::collections::HashMap;`
    use std::collections::HashMap;
    let mut m = HashMap::new();
    m.insert("class", 102);
    m.insert("class", 272);
    println!("{:?}", m);

    if let Some(c) = m.get("class") {
        println!("class={}", c);
    }
}

