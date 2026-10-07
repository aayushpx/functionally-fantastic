fn main() {
    println!("Is 8 even? {}", is_even(8));
    println!("The absolute value of -9 is {}", absolute(-9));
    println!("The largest number between 2 and 7 is {}", max(2, 7));
    let mut x = 23;
    let original = x;
    increment(&mut x);
    println!("{} incremented is {:?}", original, x);
    let v: Vec<i32> = vec![1, 2, 3, 4, 5];
    println!("The sum of {:?} is {}", v, sum(&v));
    let mut v2: Vec<i32> = vec![3, 6, 9, -2, 6,-4, 91];
    let original_v2 = v2.clone();
    // println!("Positive numbers in {:?} are {}", v2, count_positive(&v2));
    // println!("Max number in {:?} is {}", v2, find_max(&v2));
    // println!("Min number in {:?} is {}", v2, find_min(&v2));
    // println!("All elements doubles in {:?} is {:?}", v2, double_all(&v2));
    add_value(&mut v2, 99);
    println!("Original {:?}. Add 99: {:?}", original_v2, v2);

    println!("Even values of {:?} is {:?}", original_v2, even_values(&v2));
    println!("Positive values of {:?} is {:?}", original_v2, positive_values(&v2));
    println!("The count of even numbers of {:?} is {}", original_v2, count_even(&v2));
    
    let eg = String::from("abba");
    println!("{} is a palindrome?: {}", eg, is_palindrome(&eg));

}

fn is_even(n: i32) -> bool {
    n % 2 == 0
}

fn absolute(n: i32) -> i32 {
    if n < 0 {
        n * -1
    } else {
        n
    }
}

fn max(a: i32, b: i32) -> i32 {
    if a > b {
        a 
    } else {
        b
    }
}

fn increment(x: &mut i32) {
    *x += 1
}

fn sum(v: &Vec<i32>) -> i32 {
    // v.iter().sum()
    let mut total = 0;
    for x in v {
        total += *x;
    }
    total
}

fn count_positive(v: &Vec<i32>) -> i32 {
    let mut count = 0;
    for x in v {
        if *x > 0 {
            count += 1;
        }
    }
    count
}

fn find_max(v: &Vec<i32>) -> i32 {
    let mut max = v[0];

    for x in v {
        if *x > max {
            max = *x;
        } 
    }
    max
}

fn find_min(v: &Vec<i32>) -> i32 {
    let mut min = v[0];

    for x in v {
        if *x < min {
            min = *x;
        }
    }
    min
}

fn double_all(v: &Vec<i32>) -> Vec<i32> {
    let mut v2: Vec<i32> = vec![];
    for x in v {
        v2.push(*x*2);
    }
    v2
}

fn add_value(v: &mut Vec<i32>, x: i32) {
    v.push(x)
} 

fn even_values(v: &Vec<i32>) -> Vec<i32> {
    let mut evens: Vec<i32> = vec![];
    for x in v {
        if *x % 2 == 0 {
            evens.push(*x);
        }
    }
    evens
}

fn positive_values(v: &Vec<i32>) -> Vec<i32> {
    let mut positives: Vec<i32> = vec![];
    for x in v {
        if *x > 0 {
            positives.push(*x);
        }
    }
    positives
}

fn count_even(v: &Vec<i32>) -> i32 {
    let mut even_count = 0;
    for x in v {
        if *x % 2 == 0 {
            even_count += 1;
        }
    }
    even_count
}

fn sum_first_last(v: &Vec<i32>) -> i32 {
    v[0] + v[v.len() - 1]
}

fn count_greater(v: &Vec<i32>, threshold: i32) -> i32 {
    let mut count = 0;
    for x in v {
        if *x > threshold {
            count += 1;
        }
    }
    count
}

fn double_in_place(v: &mut Vec<i32>) {
    for x in v {
       *x = *x * 2;
    }
}

fn squares(v: &Vec<i32>) -> Vec<i32> {
    let mut squared = vec![];
    for x in v {
        squared.push(*x * *x);
    }
    squared
}

fn transform(v: &Vec<i32>) -> Vec<i32> {
    let mut new_vec = vec![];

    for x in v {
        if *x > 0 {
            new_vec.push(*x * 2);
        } else if *x < 0 {
            new_vec.push(*x * 3);
        } else {
            new_vec.push(*x);
        }
    }

    new_vec
}

fn first_word(s: &String) -> String { // reference to String
    let mut new_string = String::from(" ");
    for x in s.chars() { // s.chars: char
        if x != ' ' {
            new_string.push(x);
        } else {
            break;
        }
    }
    new_string
}

fn count_vowels(s: &String) -> i32 {
    let mut n_vowels = 0;
    for letter in s.chars() {
        if letter == 'a' || letter == 'e' ||
            letter == 'i' || letter == 'o' ||
            letter == 'u' {
                n_vowels += 1;
        }
    }
    n_vowels
}

fn remove_vowels(s: &String) -> String {
    let mut new_string = String::new();
    for letter in s.chars() {
        if letter != 'a' && letter != 'e' &&
            letter != 'i' && letter != 'o' &&
            letter != 'u' {
                new_string.push(letter);
        }
    }
    new_string
}


fn lowercase(s: &String) -> String {
    let mut new_string = String::new();
    for letter in s.chars() {
        if letter.is_uppercase() {
            new_string.push(letter.to_ascii_lowercase());
        } else {
            new_string.push(letter);
        }
    }
    new_string
}

fn reverse(s: &String) -> String {
    let mut rev_string = String::new();

    for x in s.chars().rev() {
        rev_string.push(x);
    }
    rev_string
}

fn is_palindrome(s: &String) -> bool {
    let mut temp = String::new();

    for l1 in s.chars().rev() {
        temp.push(l1);
    }

    // we have the string reversed, now we have to compare 
    // the original with the reverse, if they are the same,
    // then we return true, otherwise false.

    *s == temp  // outputs true or false, so no conditional needed
}
