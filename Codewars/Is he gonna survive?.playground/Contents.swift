func hero(bullets: Int, dragons: Int) -> Bool {
    return bullets >= dragons * 2 ? true : false
}

print(hero(bullets: 4, dragons: 2)) //true
