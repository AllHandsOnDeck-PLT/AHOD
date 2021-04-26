; ModuleID = 'AHOD'
source_filename = "AHOD"

@str = global [4 x i8] c"%s\0A\00"
@str.1 = global [4 x i8] c"%d\0A\00"
@str.2 = global [4 x i8] c"%g\0A\00"
@str.3 = global [4 x i8] c"%d\0A\00"
@player = global { i8*, i32 } zeroinitializer
@str.4 = private unnamed_addr constant [4 x i8] c"bob\00"
@str.5 = private unnamed_addr constant [6 x i8] c"kevin\00"

declare i32 @printf(i8*, ...)

declare { i8*, i32 } @playercall(i8*, i32)

declare i8* @getplayername({ i8*, i32 })

declare i32 @getplayerscore({ i8*, i32 })

declare i8* @setplayername({ i8*, i32 }, i8*)

declare void @setplayerscore({ i8*, i32 }, i32)

declare { i8*, i1 } @cardcall(i8*, i1)

declare i8* @getcardtype({ i8*, i1 })

declare i1 @getcardfaceup({ i8*, i1 })

define i32 @main() {
entry:
  %playercall = call { i8*, i32 } @playercall(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.4, i32 0, i32 0), i32 0)
  store { i8*, i32 } %playercall, { i8*, i32 }* @player
  %player = load { i8*, i32 }, { i8*, i32 }* @player
  %getplayername = call i8* @getplayername({ i8*, i32 } %player)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getplayername)
  %player1 = load { i8*, i32 }, { i8*, i32 }* @player
  %getplayerscore = call i32 @getplayerscore({ i8*, i32 } %player1)
  %printf2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %getplayerscore)
  %player3 = load { i8*, i32 }, { i8*, i32 }* @player
  %setplayername = call i8* @setplayername({ i8*, i32 } %player3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str.5, i32 0, i32 0))
  %player4 = load { i8*, i32 }, { i8*, i32 }* @player
  %getplayername5 = call i8* @getplayername({ i8*, i32 } %player4)
  %printf6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getplayername5)
  ret i32 0
}

define void @series_pushbool({ i32*, i1* }*, i1) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_load_2 = load i1*, i1** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i1, i1* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %series_next_el_ptr
  ret void
}

define void @series_pushint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_load_2 = load i32*, i32** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i32, i32* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %series_next_el_ptr
  ret void
}

define void @series_pushfloat({ i32*, double* }*, double) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_load_2 = load double*, double** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr double, double* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %series_next_el_ptr
  ret void
}

define void @series_pushstr({ i32*, i8** }*, i8*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_load_2 = load i8**, i8*** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr i8*, i8** %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %series_next_el_ptr
  ret void
}

define void @series_pushcard({ i32*, { i8*, i1 }* }*, { i8*, i1 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1 }* }*
  store { i32*, { i8*, i1 }* }* %0, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1 }
  store { i8*, i1 } %1, { i8*, i1 }* %val_alloc
  %series_load = load { i32*, { i8*, i1 }* }*, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1 }*, { i8*, i1 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1 }, { i8*, i1 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1 }, { i8*, i1 }* %val_alloc
  store { i8*, i1 } %val, { i8*, i1 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i32 }
  store { i8*, i32 } %1, { i8*, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i32 }, { i8*, i32 }* %val_alloc
  store { i8*, i32 } %val, { i8*, i32 }* %series_next_el_ptr
  ret void
}

define i1 @series_getbool({ i32*, i1* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %array_load = load i1*, i1** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %series_el_ptr1 = load i1, i1* %series_el_ptr
  ret i1 %series_el_ptr1
}

define i32 @series_getint({ i32*, i32* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %array_load = load i32*, i32** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %series_el_ptr1 = load i32, i32* %series_el_ptr
  ret i32 %series_el_ptr1
}

define double @series_getfloat({ i32*, double* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %array_load = load double*, double** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %series_el_ptr1 = load double, double* %series_el_ptr
  ret double %series_el_ptr1
}

define i8* @series_getstr({ i32*, i8** }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %array_load = load i8**, i8*** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %series_el_ptr1 = load i8*, i8** %series_el_ptr
  ret i8* %series_el_ptr1
}

define { i8*, i1 } @series_getcard({ i32*, { i8*, i1 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1 }* }*
  store { i32*, { i8*, i1 }* }* %0, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1 }* }*, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1 }*, { i8*, i1 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1 }, { i8*, i1 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1 }, { i8*, i1 }* %series_el_ptr
  ret { i8*, i1 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer({ i32*, { i8*, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i32 }*, { i8*, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i32 }, { i8*, i32 }* %series_el_ptr
  ret { i8*, i32 } %series_el_ptr1
}

define i32 @series_sizebool({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard({ i32*, { i8*, i1 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1 }* }*
  store { i32*, { i8*, i1 }* }* %0, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1 }* }*, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 1
  %series_arr_load = load i1*, i1** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i1, i1* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i1, i1* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i1 %series_arry_next_element
}

define i32 @series_popint({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 1
  %series_arr_load = load i32*, i32** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i32, i32* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i32, i32* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i32 %series_arry_next_element
}

define double @series_popfloat({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 1
  %series_arr_load = load double*, double** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr double, double* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load double, double* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret double %series_arry_next_element
}

define i8* @series_popstr({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 1
  %series_arr_load = load i8**, i8*** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr i8*, i8** %series_arr_load, i32 %dec_size
  %series_arry_next_element = load i8*, i8** %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret i8* %series_arry_next_element
}

define { i8*, i1 } @series_popcard({ i32*, { i8*, i1 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1 }* }*
  store { i32*, { i8*, i1 }* }* %0, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1 }* }*, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1 }*, { i8*, i1 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1 }, { i8*, i1 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1 }, { i8*, i1 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i32 }*, { i8*, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i32 }, { i8*, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i32 }, { i8*, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i32 } %series_arry_next_element
}
