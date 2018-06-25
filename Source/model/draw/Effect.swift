open class Effect {

    open let input: Effect?

    public init(input: Effect?) {
        self.input = input
    }

    public static func dropShadow(dx: Double = 0, dy: Double = -3, radius: Double = 3, color: Color = .black) -> Effect? {
        return OffsetEffect(dx: dx, dy: dy).setColor(to: color).blur(radius: radius).blend()
    }

    public func offset(dx: Double, dy: Double) -> Effect {
        return OffsetEffect(dx: dx, dy: dy, input: self)
    }

    public func mapColor(with matrix: ColorMatrix) -> Effect {
        return ColorMatrixEffect(matrix: matrix, input: self)
    }

    public func setColor(to color: Color) -> Effect {
        return ColorMatrixEffect(matrix: ColorMatrix(color: color), input: self)
    }

    public func blur(radius: Double) -> Effect {
        return GaussianBlur(radius: radius, input: self)
    }

    public func blend() -> Effect {
        return BlendEffect(input: self)
    }
}
