//
//  DishData.swift
//  Baby Bites
//
//  Created by Zefanya on 23/08/24.
//

import Foundation


//Dish
let scrambledEggs = Dish2(
    name: "Scrambled Eggs",
    category: "Protein",
    texture: "Soft",
    duration: "8 minutes",
    recipe: """
    What you need:
    1 small egg
    1 tbsp whole milk
    1 tsp vegetable oil spread
    
    How to make:
    1. Crack the egg into a small bowl.
    2. Add the whole milk to the egg and mix.
    3. Heat the vegetable oil spread in a non-stick saucepan.
    4. Remove from heat when the egg is cooked but not rubbery, allow to cool before serving.
    """,
    image:"scrambled", description: "a dish made from eggs (usually chicken eggs) stirred, whipped, or beaten together."
)

let omeletteEggs = Dish2(
    name: "Omelette Eggs",
    category: "Protein",
    texture: "Soft",
    duration: "8 minutes",
    recipe: """
    What you need:
    1 medium egg
    1 tablespoon vegetable oil
    1/2 medium pepper (any colour), chopped
    1 small onion, peeled and chopped
    
    How to make:
    1. Crack the egg into a mixing bowl and beat.
    2. Heat the oil in a frying pan, add the onion and pepper, cook until soft (3 to 4 mins).
    3. Pour the egg into the frying pan, with the onion and pepper. Cook until the egg is set and the base is golden (2 to 3 mins).
    4. Allow to cool a little, then cut into finger-sized slices for easy feeding.
    """,
    image:"", description: ""
)

let boiledEgg = Dish2(
    name: "Boiled Egg",
    category: "Protein",
    texture: "Soft",
    duration: "10 minutes",
    recipe: """
    What you need:
    1 medium egg
    
    How to make:
    1. Bring a pan of water to the boil. Gently place the egg into the pan, boil for 5 minutes.
    2. Once cooked, place the egg in a bowl of cold water to cool down (2 to 3 minutes).
    3. When cool, peel the outer shell and slice the egg into quarters (4 fingers).
    4. Offer your baby 2 egg fingers.
    """,
    image:"", description: ""
)

let bakedSalmon = Dish2(
    name: "Baked Salmon",
    category: "Protein",
    texture: "Tender",
    duration: "25 minutes",
    recipe: """
    What you need:
    1 salmon fillet
    
    How to make:
    1. Preheat the oven to 180C (fan).
    2. Place the salmon in an ovenproof dish, cover, and bake for about 20 minutes (until it's cooked through and flakes easily).
    3. Allow to cool, check for any bones that may need removing.
    4. Flake a quarter of the salmon into a bowl and serve.
    """,
    image:"", description: "Soft and flaky baked salmon, mild in flavor and easy for babies to chew, providing essential nutrients."
)

let creamyBroccoliMash = Dish2(
    name: "Creamy Broccoli Mash",
    category: "Vegetables",
    texture: "Soft",
    duration: "13 minutes",
    recipe: """
    What you need:
    1 medium broccoli – stalks removed, washed and chopped into small chunks (approx 200g)
    
    How to make:
    1. Bring a pan of water to the boil, place chopped broccoli florets in the pan and cook until tender, about 8 minutes.
    2. Drain, then blend or mash with a fork to get a smooth consistency. If the mixture is too thick, add a little full-fat milk or baby's usual milk.
    3. Allow to cool before serving. Freeze any leftover portions in small pots or ice cube trays.
    """,
    image:"", description: "Silky mashed broccoli, blended to a creamy texture, making it easy for babies to digest."
)

let choppedChicken = Dish2(
    name: "Chopped Chicken",
    category: "Protein",
    texture: "Tender",
    duration: "20 - 30 minutes",
    recipe: """
    What you need:
    1 chicken breast or thigh (boneless and skinless)
    
    How to make:
    1. Bake, grill, or boil the chicken for 20-30 minutes until fully cooked and tender.
    2. Let cool, then chop into small, bite-sized pieces.
    3. Offer with age-appropriate sides like steamed veggies or soft fruit.
    """,
    image:"", description: "Soft, tender pieces of grilled chicken, cut into manageable sizes for babies to handle."
)

let shreddedChicken = Dish2(
    name: "Shredded Chicken",
    category: "Protein",
    texture: "Tender",
    duration: "20 - 30 minutes",
    recipe: """
    What you need:
    1 cooked chicken breast or thigh (boneless and skinless)
    
    How to make:
    1. Bake, grill, or boil the chicken for 20-30 minutes until fully cooked and tender.
    2. Let the chicken cool slightly, then use two forks or your fingers to shred it into small, manageable pieces.
    3. Offer the shredded chicken with age-appropriate sides like steamed vegetables, soft fruit, or mixed into a mild sauce or broth.
    """,
    image:"", description: "Fine shreds of juicy chicken, easy for babies to chew and swallow, great for finger foods."
)

let groundedChicken = Dish2(
    name: "Grounded Chicken",
    category: "Protein",
    texture: "Soft",
    duration: "10 - 15 minutes",
    recipe: """
    What you need:
    1 cup ground chicken (fresh or thawed)
    
    How to make:
    1. Heat a skillet over medium heat. Add the ground chicken and cook for 10-15 minutes, stirring occasionally, until fully cooked and no longer pink.
    2. Use a spoon or spatula to break up the chicken into small, crumbly pieces while cooking.
    3. Serve the ground chicken as-is or mixed with age-appropriate sides like soft vegetables, rice, or pasta.
    """,
    image:"", description: "Smooth, finely ground chicken, perfect for mixing into purees or forming into soft patties."
)

let handledBanana = Dish2(
    name: "Handled Banana",
    category: "Fruits",
    texture: "Soft",
    duration: "1 minute",
    recipe: """
    What you need:
    1 ripe banana
    
    How to make:
    1. Cut the banana in half, leaving the peel on the bottom half to act as a "handle."
    2. Peel away the top half of the banana, leaving the bottom half with the peel intact.
    3. Offer the banana to your baby with the peel still on the bottom half, making it easier for them to grip and eat.
    """,
    image:"", description: "A half or small banana, easy for babies to hold and nibble on, promoting self-feeding."
)

let bananaBites = Dish2(
    name: "Banana Bites",
    category: "Fruits",
    texture: "Soft",
    duration: "1 minute",
    recipe: """
    What you need:
    1 ripe banana
    
    How to make:
    1. Peel the banana and slice it into small, bite-sized rounds, about 1/2 inch thick.
    2. Arrange the banana slices on a plate and serve them directly as bite-sized snacks.
    """,
    image:"", description: "Soft, bite-sized banana pieces, ideal for babies learning to eat solid foods."
)

let bananaPuree = Dish2(
    name: "Banana Puree",
    category: "Fruits",
    texture: "Soft",
    duration: "2 minutes",
    recipe: """
    What you need:
    1 ripe banana
    1/2 to 1 teaspoon of breast milk
    
    How to make:
    1. Peel the banana and cut it into small pieces.
    2. Place the banana pieces in a bowl. Use a fork or potato masher to mash the banana until smooth.
    3. Add 1/2 to 1 teaspoon of breast milk to the mashed banana. Stir to combine.
    4. Spoon the banana purée into your baby's bowl and serve immediately.
    """,
    image:"", description: "Creamy banana puree, smooth and easy to swallow, perfect for babies just starting solids."
)

let avocadoMash = Dish2(
    name: "Avocado Mash",
    category: "Fruits",
    texture: "Soft",
    duration: "1 minute",
    recipe: """
    What you need:
    1 ripe avocado
    
    How to make:
    1. Cut the avocado in half.
    2. Use a spoon to scoop out the avocado into a bowl.
    3. Use a fork to mash up the avocado.
    """,
    image:"", description: "Smooth and creamy mashed avocado, easy for babies to eat and packed with healthy fats."
)

let avocadoBites = Dish2(
    name: "Avocado Bites",
    category: "Fruits",
    texture: "Soft",
    duration: "1 minute",
    recipe: """
    What you need:
    1 ripe avocado
    
    How to make:
    1. Cut the avocado in half, remove the pit, and scoop out the flesh.
    2. Cut the avocado into small, bite-sized pieces.
    """,
    image:"", description: "Soft, bite-sized avocado chunks, perfect for little fingers to pick up and enjoy"
)

let avocadoSlices = Dish2(
    name: "Avocado Slices",
    category: "Fruits",
    texture: "Soft",
    duration: "1 minute",
    recipe: """
    What you need:
    1 ripe avocado
    
    How to make:
    1. Cut the avocado in half, remove the pit, and scoop out the flesh.
    2. Place the avocado halves cut-side down. Slice into thin or thick slices, depending on preference.
    3. Arrange the slices on a plate.
    """,
    image:"", description: "Gentle, thin slices of avocado, ideal for babies to practice self-feeding."
)


