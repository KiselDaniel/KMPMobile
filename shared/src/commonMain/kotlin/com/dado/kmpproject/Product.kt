package com.dado.kmpproject

import kotlinx.serialization.Serializable

@Serializable
data class Product(
    val id: Int,
    val title: String,
    val price: Double,
    val description: String,
    val category: String,
    val image: String
)

@Serializable
data class ProductsList(
    val items: List<Product>
)
