@testset "flatten" begin

    @testset "Reals" begin
        test_flatten_interface(1.0)

        @testset "Integers" begin
            test_flatten_interface(1)
            @test isempty(first(flatten(1)))
        end
    end

    @testset "AbstractArrays" begin
        test_flatten_interface(randn(10))
        test_flatten_interface(randn(5, 4))
        test_flatten_interface([randn(5) for _ in 1:3])
    end

    @testset "Tuple" begin
        test_flatten_interface((1.0, 2.0))
        test_flatten_interface((1.0, (2.0, 3.0), randn(5)))
    end

    @testset "NamedTuple" begin
        test_flatten_interface((a=1.0, b=(2.0, 3.0), c=(e=5.0,)))
    end

    @testset "Dict" begin
        test_flatten_interface(Dict(:a => (a=4.0, b=3.0), :b => 5.0))
    end
end
