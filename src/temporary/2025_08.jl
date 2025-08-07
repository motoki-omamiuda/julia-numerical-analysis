using Plots: plot, savefig

X = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Y = [0, 1, 0, 2, 0, 4, 0, 8, 0, 4, 4]

p = plot(X, Y)
savefig(p, "./data/plot.png")  # plot.png に保存