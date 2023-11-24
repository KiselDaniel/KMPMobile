package com.dado.kmpproject

import kotlinx.serialization.Serializable

@Serializable
sealed class RequestState {
    @Serializable
    data object Idle : RequestState()
    @Serializable
    data object Loading : RequestState()
    @Serializable
    data class Success(val data: ProductsList) : RequestState()
    @Serializable
    data class Error(val message: String) : RequestState()

    fun isLoading(): Boolean = this is Loading
    fun isSuccess(): Boolean = this is Success
    fun isError(): Boolean = this is Error

    fun getProducts(): ProductsList {
        return when (this) {
            is Success -> ProductsList(data.items)
            else -> ProductsList(emptyList())
        }
    }

    fun getErrorMessage(): String {
        return when (this) {
            is Error -> message
            else -> ""
        }
    }
}
