fn main() {
    // Signed integers: i8 ... i128, isize
    // Unsigned ints: u8 ... u128, usize 
    // Floats: f32, f64
    // Boolean: bool 
    // Characters: char (unicode, 32-bit)
    // Tuples: (type1, ..., typen)
    let circle: (i32, i32, u32) = (2, -2, 3);
    let radius = circle.2; // indexing, 3rd element

    // Arrays: [type; size]
    let a: [i32; 5] = [1, 2, 3, 4, 5];
    let b = [3; 5];  // [3, 3, 3, 3, 3, 3];
    
    // Functions
    fn gcd(a: u32, b: u32) -> u32 {  
        //  a function that takes two parameters, a and b as arguments as unsigned ints.
        //  returns an unsigned int
        //  return keyword is optional
        if b == 0 { a } else { gcd(b, a % b) }
    }

    println! ("{}", gcd(14, 8));


    // Conditionals
    let x: u32 = 10;
    let parity = if x % 2 == 0 { "even" } else { "odd" };
    println!("{}", parity);

    // Loops
    let mut a: u32 = 9;
    let mut b: u32 = 2;
    loop {  // infinite loop
        if b == 0 { break };
        (a,b) = (b, a % b);
    };

    while b != 0 {
        (a,b) = (b, a % b);
    }

    let array: [i32; 5] = [1, 2, 3, 4, 5];
    for x in array {
        println!("array contains {}", x);
    }

    for i in 0..5 {
        println!("array[{}] = {}", i, array[i]);
    }

    // Enums: data type combining multiple options
    enum Colour {Red, Green, Blue};
    let c = Colour::Red;


    enum Graphic {
        Rectangle(u32, u32),
        Circle(u32),
        Text(String, Colour)
    }
    let g = Graphic::Rectangle(3, 2);

    enum Option<T> { None, Some(T) }


    // Pattern Matching
    let cname = match c {
        Colour::Red => "red",
        Colour::Green => "green",
        _ => "neither red nor green"
    };

    // match g {
    //     Graphic::Rectangle(l,h, ) => draw_rect(l, h),
    //     Graphic::Circle(r) => draw_circle(r),
    //     Graphic::Text(t, c) => {
    //         set_colour(c); print(t);
    //     }
    // }
}
