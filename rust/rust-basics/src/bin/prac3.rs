fn main() {
    let numbers: [i32; 5] = [1, 2, 3, 4, 5];
    println!("Number array: {:?}", numbers);

    let fruits: [&str; 3] = ["Apple", "Banana", "Orange"];
    println!("Fruits Array: {}", fruits[0]);

    let human = ("Alice", 30, false);
    println!("Human Tuple: {:?}", human);

    let my_mix_tuple = ("Kratos", 40, false, [1, 2, 3, 4, 5]);
    println!("My Mix Tuple: {:?}", my_mix_tuple);

    let number_slices: &[i32; 5]  = &[1, 2, 3, 4, 5];
    println!("Number Slice: {:?}", number_slices);

    let mut stone_cold:String = String::from("Hell, ");
    stone_cold.push_str("Yeah!");
    println!("Stone Cold Says: {}", stone_cold);
    
    let string: String = String::from("Hello, World!");
    let slice: &str = &string[0..5];
    println!("Slice Value: {}", slice);

    human_id("John", 16, 36.2);

    let _x = {
        let price = 5;
        let qty = 10;
        price * qty
    };

    let s1 = String::from("RUST");
    let len = calculate_length(&s1);
    println!("Length of \"{}\" is {}", s1, len);

    let mut _s = 5;
    let _t = &mut _s;
    *_t += 1;

    println!("{}", _t);
    println!("\n{}", _s);

    let mut account = BankAccount {
        owner: "Alice".to_string(),
        balance: 366.99
    };

    // immutable borrow to check balance
    account.check_balance();

    // Mutable withdraw 
    account.withdraw(50.50);

    account.check_balance();

    const Y: i32 = 10;
    println!("{}", Y);

    let v = Y + 2;

    {
        let v = Y * 2;
        println!("{}", v);
    }

    println!("{}", v);
    
    let age: u16 = 18;
    if age >= 18 {
        println!("You're old enough to drive a car!");
    } else {
        println!("You can't drive a car!");
    }

    let mut index = 0;

    let result = loop {
        index += 1;

        if index == 10 {
            break index * 2;
        }
    };
    println!("The result is {}", result);
}

struct BankAccount {
    owner: String,
    balance: f64
}

impl BankAccount {
    fn withdraw(&mut self, amount: f64){
        println!("WIthdrawing {} from account owned by {}", amount, self.owner);
        self.balance -= amount;
    }

    fn check_balance(&self) {
        println!("Account owneed by {} has the balance of {}", self.owner, self.balance);
    }
}

fn calculate_length(s:&String) -> usize {
    s.len()
}

fn _calculate_bmi(weight_kg: f64, height_m: f64) -> f64 {
    weight_kg/(height_m*height_m)
}


fn _add(a: i32, b: i32) -> i32 {
    a + b
}

fn human_id(name: &str, age: u32, height: f32){
    println!("My name is {}, I am {} years old, and my height is {}ft", name, age, height);
}
