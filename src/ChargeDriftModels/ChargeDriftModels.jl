abstract type AbstractChargeDriftModel{T <: SSDFloat} end
abstract type AbstractTemperatureModel{T <: SSDFloat} end

include("ElectricFieldChargeDriftModel/ElectricFieldChargeDriftModel.jl")
include("ADLChargeDriftModel/ADLChargeDriftModel.jl")
include("IsotropicChargeDriftModel/IsotropicChargeDriftModel.jl")
include("InactiveLayerChargeDriftModel/InactiveLayerChargeDriftModel.jl")

"""
    getV(fv::SVector{3,T}, cdm::AbstractChargeDriftModel{T}, pos::CartesianPoint{T}, ::Type{CC}) where {CC <: ChargeCarrier}

Drift velocity of a charge carrier of type `CC` (`Electron` or `Hole`) at `pos` for the field vector `fv`.
Dispatches to `getVe` / `getVh`; lets per-carrier code be written once.
"""
@inline getV(fv::SVector{3, T}, cdm::AbstractChargeDriftModel{T}, pos::CartesianPoint{T}, ::Type{Electron}) where {T <: SSDFloat} = getVe(fv, cdm, pos)
@inline getV(fv::SVector{3, T}, cdm::AbstractChargeDriftModel{T}, pos::CartesianPoint{T}, ::Type{Hole}) where {T <: SSDFloat} = getVh(fv, cdm, pos)
