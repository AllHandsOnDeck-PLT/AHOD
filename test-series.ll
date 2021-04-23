; ModuleID = 'AHOD'
source_filename = "AHOD"

@str = global [4 x i8] c"%s\0A\00"
@str.1 = global [4 x i8] c"%d\0A\00"
@str.2 = global [4 x i8] c"%g\0A\00"
@str.3 = global [4 x i8] c"%d\0A\00"
@a = global { i32*, i32* } zeroinitializer

define i32 @main() {
entry:
  %new_series_ptr = alloca { i32*, i32* }
  %series_size_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series.arry = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr, i32 0, i32 1
  %p = alloca i32, i32 1028
  store i32* %p, i32** %series.arry
  call void @series_addint({ i32*, i32* }* %new_series_ptr, i32 1)
  call void @series_addint({ i32*, i32* }* %new_series_ptr, i32 3)
  %new_series = load { i32*, i32* }, { i32*, i32* }* %new_series_ptr
  store { i32*, i32* } %new_series, { i32*, i32* }* @a
  %series_get = call i32 @series_getint({ i32*, i32* }* @a, i32 1)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %series_get)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define void @series_addbool({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_array_load = load i1*, i1** %series_array_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_arry_next_element_ptr = getelementptr i1, i1* %series_array_load, i32 %series_size
  %inc_size = add i32 %series_size, 1
  store i32 %inc_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_arry_next_element_ptr
  ret void
}

define void @series_addint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_array_load = load i32*, i32** %series_array_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_arry_next_element_ptr = getelementptr i32, i32* %series_array_load, i32 %series_size
  %inc_size = add i32 %series_size, 1
  store i32 %inc_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_arry_next_element_ptr
  ret void
}

define void @series_addfloat({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_array_load = load double*, double** %series_array_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_arry_next_element_ptr = getelementptr double, double* %series_array_load, i32 %series_size
  %inc_size = add i32 %series_size, 1
  store i32 %inc_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_arry_next_element_ptr
  ret void
}

define void @series_addstr({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_array_load = load i8**, i8*** %series_array_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_arry_next_element_ptr = getelementptr i8*, i8** %series_array_load, i32 %series_size
  %inc_size = add i32 %series_size, 1
  store i32 %inc_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_arry_next_element_ptr
  ret void
}

define i1 @series_getbool({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %series_arry_element_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_array_element_ptr = load i1, i1* %series_arry_element_ptr
  ret i1 %series_array_element_ptr
}

define i32 @series_getint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %series_arry_element_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_array_element_ptr = load i32, i32* %series_arry_element_ptr
  ret i32 %series_array_element_ptr
}

define double @series_getfloat({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %series_arry_element_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_array_element_ptr = load double, double* %series_arry_element_ptr
  ret double %series_array_element_ptr
}

define i8* @series_getstr({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %series_arry_element_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_array_element_ptr = load i8*, i8** %series_arry_element_ptr
  ret i8* %series_array_element_ptr
}
