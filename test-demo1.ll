; ModuleID = 'AHOD'
source_filename = "AHOD"

@str = global [4 x i8] c"%s\0A\00"
@str.1 = global [4 x i8] c"%d\0A\00"
@str.2 = global [4 x i8] c"%g\0A\00"
@str.3 = global [4 x i8] c"%d\0A\00"
@i = global i32 0
@deck = global { i32*, { i8*, i1 }* } zeroinitializer
@str.4 = private unnamed_addr constant [3 x i8] c"R0\00"
@str.5 = private unnamed_addr constant [3 x i8] c"R1\00"
@str.6 = private unnamed_addr constant [3 x i8] c"R2\00"
@str.7 = private unnamed_addr constant [3 x i8] c"R3\00"
@str.8 = private unnamed_addr constant [3 x i8] c"R4\00"
@str.33 = private unnamed_addr constant [3 x i8] c"D0\00"

declare i32 @printf(i8*, ...)

declare { i8*, i32 } @playercall(i8*, i32)

declare i8* @getplayername({ i8*, i32 })

declare i32 @getplayerscore({ i8*, i32 })

declare i8* @setplayername({ i8*, i32 }, i8*)

declare void @setplayerscore({ i8*, i32 }, i32)

declare { i8*, i1 } @cardcall(i8*, i1)

declare i8* @getcardtype({ i8*, i1 })

declare i1 @getcardfaceup({ i8*, i1 })

define { i32*, { i8*, i1 }* } @CREATEDECK({ i32*, { i8*, i1 }* } %deck) {
entry:
  %deck1 = alloca { i32*, { i8*, i1 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %deck1, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series.arry = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %deck1, i32 0, i32 1
  %p = alloca { i8*, i1 }, i32 1028
  store { i8*, i1 }* %p, { i8*, i1 }** %series.arry
  store { i32*, { i8*, i1 }* } %deck, { i32*, { i8*, i1 }* }* %deck1
  %types = alloca { i32*, i8** }
  %series_size_ptr2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 0
  %series_size3 = alloca i32
  store i32 0, i32* %series_size3
  store i32* %series_size3, i32** %series_size_ptr2
  %series.arry4 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 1
  %p5 = alloca i8*, i32 1028
  store i8** %p5, i8*** %series.arry4
  %type = alloca i8*
  %card = alloca { i8*, i1 }
  %new_series_ptr = alloca { i32*, i8** }
  %series_size_ptr6 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 0
  %series_size7 = alloca i32
  store i32 0, i32* %series_size7
  store i32* %series_size7, i32** %series_size_ptr6
  %series = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 1
  %p8 = alloca i8*, i32 1028
  store i8** %p8, i8*** %series
  call void @series_pushstr({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.4, i32 0, i32 0))
  call void @series_pushstr({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.5, i32 0, i32 0))
  call void @series_pushstr({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.6, i32 0, i32 0))
  call void @series_pushstr({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.7, i32 0, i32 0))
  call void @series_pushstr({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.8, i32 0, i32 0))
  %new_series = load { i32*, i8** }, { i32*, i8** }* %new_series_ptr
  store { i32*, i8** } %new_series, { i32*, i8** }* %types
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i12 = load i32, i32* @i
  %series_size13 = call i32 @series_sizestr({ i32*, i8** }* %types)
  %tmp14 = icmp slt i32 %i12, %series_size13
  br i1 %tmp14, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get = call i8* @series_getstr({ i32*, i8** }* %types, i32 %i)
  store i8* %series_get, i8** %type
  %type9 = load i8*, i8** %type
  %cardcall = call { i8*, i1 } @cardcall(i8* %type9, i1 true)
  store { i8*, i1 } %cardcall, { i8*, i1 }* %card
  %card10 = load { i8*, i1 }, { i8*, i1 }* %card
  call void @series_pushcard({ i32*, { i8*, i1 }* }* %deck1, { i8*, i1 } %card10)
  %i11 = load i32, i32* @i
  %tmp = add i32 %i11, 1
  store i32 %tmp, i32* @i
  br label %while

merge:                                            ; preds = %while
  %deck15 = load { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %deck1
  ret { i32*, { i8*, i1 }* } %deck15
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

define i32 @main() {
entry:
  %card = alloca { i8*, i1 }
  %new_series_ptr = alloca { i32*, { i8*, i1 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %new_series_ptr, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %new_series_ptr, i32 0, i32 1
  %p = alloca { i8*, i1 }, i32 1028
  store { i8*, i1 }* %p, { i8*, i1 }** %series
  %cardcall = call { i8*, i1 } @cardcall(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.33, i32 0, i32 0), i1 true)
  call void @series_pushcard.13({ i32*, { i8*, i1 }* }* %new_series_ptr, { i8*, i1 } %cardcall)
  %new_series = load { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %new_series_ptr
  store { i32*, { i8*, i1 }* } %new_series, { i32*, { i8*, i1 }* }* @deck
  %deck = load { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* @deck
  %CREATEDECK_result = call { i32*, { i8*, i1 }* } @CREATEDECK({ i32*, { i8*, i1 }* } %deck)
  store { i32*, { i8*, i1 }* } %CREATEDECK_result, { i32*, { i8*, i1 }* }* @deck
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i5 = load i32, i32* @i
  %tmp6 = icmp slt i32 %i5, 5
  br i1 %tmp6, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get = call { i8*, i1 } @series_getcard.19({ i32*, { i8*, i1 }* }* @deck, i32 %i)
  store { i8*, i1 } %series_get, { i8*, i1 }* %card
  %card1 = load { i8*, i1 }, { i8*, i1 }* %card
  %getcardtype = call i8* @getcardtype({ i8*, i1 } %card1)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype)
  %card2 = load { i8*, i1 }, { i8*, i1 }* %card
  %getcardfaceup = call i1 @getcardfaceup({ i8*, i1 } %card2)
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.3, i32 0, i32 0), i1 %getcardfaceup)
  %i4 = load i32, i32* @i
  %tmp = add i32 %i4, 1
  store i32 %tmp, i32* @i
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

define void @series_pushbool.9({ i32*, i1* }*, i1) {
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

define void @series_pushint.10({ i32*, i32* }*, i32) {
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

define void @series_pushfloat.11({ i32*, double* }*, double) {
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

define void @series_pushstr.12({ i32*, i8** }*, i8*) {
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

define void @series_pushcard.13({ i32*, { i8*, i1 }* }*, { i8*, i1 }) {
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

define void @series_pushplayer.14({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
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

define i1 @series_getbool.15({ i32*, i1* }*, i32) {
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

define i32 @series_getint.16({ i32*, i32* }*, i32) {
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

define double @series_getfloat.17({ i32*, double* }*, i32) {
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

define i8* @series_getstr.18({ i32*, i8** }*, i32) {
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

define { i8*, i1 } @series_getcard.19({ i32*, { i8*, i1 }* }*, i32) {
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

define { i8*, i32 } @series_getplayer.20({ i32*, { i8*, i32 }* }*, i32) {
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

define i32 @series_sizebool.21({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.22({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.23({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.24({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.25({ i32*, { i8*, i1 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1 }* }*
  store { i32*, { i8*, i1 }* }* %0, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1 }* }*, { i32*, { i8*, i1 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1 }* }, { i32*, { i8*, i1 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.26({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.27({ i32*, i1* }*) {
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

define i32 @series_popint.28({ i32*, i32* }*) {
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

define double @series_popfloat.29({ i32*, double* }*) {
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

define i8* @series_popstr.30({ i32*, i8** }*) {
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

define { i8*, i1 } @series_popcard.31({ i32*, { i8*, i1 }* }*) {
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

define { i8*, i32 } @series_popplayer.32({ i32*, { i8*, i32 }* }*) {
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
