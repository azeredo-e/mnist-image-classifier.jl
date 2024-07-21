using Images

function create_dataset(path)
    X = []
    y = []

    for label in readdir(path)
        for file in readdir("$path/$label")
            img = load("$path/$label/$file")
            data = reshape(Float32.(channelview(img)), 28, 28, 1)
            if length(X) == 0
                X = data
            else
                X = cat(X, data, dims=3)
            end
            push!(y, parse(Float32, label))
        end
    end

    return X, y
end

