function calc()
    a = 3
    a += 5

    print(a)

    open("results/result.txt", "w") do f
        println(f, a)
    end
end