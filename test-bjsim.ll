; ModuleID = 'AHOD'
source_filename = "AHOD"

@str = global [4 x i8] c"%s\0A\00"
@str.1 = global [4 x i8] c"%d\0A\00"
@str.2 = global [4 x i8] c"%g\0A\00"
@str.3 = global [4 x i8] c"%d\0A\00"
@deck = global { i32*, { i8*, i1, i32 }* } zeroinitializer
@i = global i32 0
@score = global i32 0
@str.4 = private unnamed_addr constant [46 x i8] c"Hello, and welcome to our Blackjack Simulator\00"
@str.5 = private unnamed_addr constant [61 x i8] c"First things first let us welcome our player for the evening\00"
@str.30 = private unnamed_addr constant [3 x i8] c"R3\00"
@str.31 = private unnamed_addr constant [3 x i8] c"R9\00"
@str.32 = private unnamed_addr constant [3 x i8] c"B9\00"
@str.33 = private unnamed_addr constant [3 x i8] c"B2\00"
@str.34 = private unnamed_addr constant [3 x i8] c"R3\00"
@str.59 = private unnamed_addr constant [3 x i8] c"R5\00"
@str.60 = private unnamed_addr constant [45 x i8] c"There are 5 cards in the hand. A Hit Request\00"
@str.61 = private unnamed_addr constant [22 x i8] c"A 3 value not too bad\00"
@str.62 = private unnamed_addr constant [20 x i8] c"Another hit request\00"
@str.63 = private unnamed_addr constant [74 x i8] c"Looks like we stop here for tonight. Time to see what the next cards were\00"

declare i32 @printf(i8*, ...)

declare { i8*, i32 } @playercall(i8*, i32)

declare i8* @getplayername({ i8*, i32 })

declare i32 @getplayerscore({ i8*, i32 })

declare { i8*, i1, i32 } @cardcall(i8*, i1, i32)

declare i8* @getcardtype({ i8*, i1, i32 })

declare i1 @getcardfaceup({ i8*, i1, i32 })

declare i32 @getcardvalue({ i8*, i1, i32 })

define void @INTRO() {
entry:
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @str.4, i32 0, i32 0))
  %printf1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.5, i32 0, i32 0))
  ret void
}

define { i32*, { i8*, i1, i32 }* } @CREATEDECK({ i32*, { i8*, i1, i32 }* } %deck) {
entry:
  %deck1 = alloca { i32*, { i8*, i1, i32 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series.arry = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1, i32 0, i32 1
  %p = alloca { i8*, i1, i32 }, i32 1028
  store { i8*, i1, i32 }* %p, { i8*, i1, i32 }** %series.arry
  store { i32*, { i8*, i1, i32 }* } %deck, { i32*, { i8*, i1, i32 }* }* %deck1
  %types = alloca { i32*, i8** }
  %series_size_ptr2 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 0
  %series_size3 = alloca i32
  store i32 0, i32* %series_size3
  store i32* %series_size3, i32** %series_size_ptr2
  %series.arry4 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %types, i32 0, i32 1
  %p5 = alloca i8*, i32 1028
  store i8** %p5, i8*** %series.arry4
  %values = alloca { i32*, i32* }
  %series_size_ptr6 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %values, i32 0, i32 0
  %series_size7 = alloca i32
  store i32 0, i32* %series_size7
  store i32* %series_size7, i32** %series_size_ptr6
  %series.arry8 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %values, i32 0, i32 1
  %p9 = alloca i32, i32 1028
  store i32* %p9, i32** %series.arry8
  %value = alloca i32
  %type = alloca i8*
  %card = alloca { i8*, i1, i32 }
  %new_series_ptr = alloca { i32*, i8** }
  %series_size_ptr10 = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 0
  %series_size11 = alloca i32
  store i32 0, i32* %series_size11
  store i32* %series_size11, i32** %series_size_ptr10
  %series = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %new_series_ptr, i32 0, i32 1
  %p12 = alloca i8*, i32 1028
  store i8** %p12, i8*** %series
  call void @series_pushstr.9({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.30, i32 0, i32 0))
  call void @series_pushstr.9({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.31, i32 0, i32 0))
  call void @series_pushstr.9({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.32, i32 0, i32 0))
  call void @series_pushstr.9({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.33, i32 0, i32 0))
  call void @series_pushstr.9({ i32*, i8** }* %new_series_ptr, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.34, i32 0, i32 0))
  %new_series = load { i32*, i8** }, { i32*, i8** }* %new_series_ptr
  store { i32*, i8** } %new_series, { i32*, i8** }* %types
  %new_series_ptr13 = alloca { i32*, i32* }
  %series_size_ptr14 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr13, i32 0, i32 0
  %series_size15 = alloca i32
  store i32 0, i32* %series_size15
  store i32* %series_size15, i32** %series_size_ptr14
  %series16 = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %new_series_ptr13, i32 0, i32 1
  %p17 = alloca i32, i32 1028
  store i32* %p17, i32** %series16
  call void @series_pushint.7({ i32*, i32* }* %new_series_ptr13, i32 3)
  call void @series_pushint.7({ i32*, i32* }* %new_series_ptr13, i32 9)
  call void @series_pushint.7({ i32*, i32* }* %new_series_ptr13, i32 9)
  call void @series_pushint.7({ i32*, i32* }* %new_series_ptr13, i32 2)
  call void @series_pushint.7({ i32*, i32* }* %new_series_ptr13, i32 3)
  %new_series18 = load { i32*, i32* }, { i32*, i32* }* %new_series_ptr13
  store { i32*, i32* } %new_series18, { i32*, i32* }* %values
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i25 = load i32, i32* @i
  %series_size26 = call i32 @series_sizestr.21({ i32*, i8** }* %types)
  %tmp27 = icmp slt i32 %i25, %series_size26
  br i1 %tmp27, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get = call i8* @series_getstr.15({ i32*, i8** }* %types, i32 %i)
  store i8* %series_get, i8** %type
  %i19 = load i32, i32* @i
  %series_get20 = call i32 @series_getint.13({ i32*, i32* }* %values, i32 %i19)
  store i32 %series_get20, i32* %value
  %type21 = load i8*, i8** %type
  %value22 = load i32, i32* %value
  %cardcall = call { i8*, i1, i32 } @cardcall(i8* %type21, i1 true, i32 %value22)
  store { i8*, i1, i32 } %cardcall, { i8*, i1, i32 }* %card
  %card23 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  call void @series_pushcard.10({ i32*, { i8*, i1, i32 }* }* %deck1, { i8*, i1, i32 } %card23)
  %i24 = load i32, i32* @i
  %tmp = add i32 %i24, 1
  store i32 %tmp, i32* @i
  br label %while

merge:                                            ; preds = %while
  %deck28 = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %deck1
  ret { i32*, { i8*, i1, i32 }* } %deck28
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

define void @series_pushcard({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
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

define { i8*, i1, i32 } @series_getcard({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
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

define i32 @series_sizecard({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
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

define { i8*, i1, i32 } @series_popcard({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
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

define void @series_pushbool.6({ i32*, i1* }*, i1) {
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

define void @series_pushint.7({ i32*, i32* }*, i32) {
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

define void @series_pushfloat.8({ i32*, double* }*, double) {
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

define void @series_pushstr.9({ i32*, i8** }*, i8*) {
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

define void @series_pushcard.10({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer.11({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
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

define i1 @series_getbool.12({ i32*, i1* }*, i32) {
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

define i32 @series_getint.13({ i32*, i32* }*, i32) {
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

define double @series_getfloat.14({ i32*, double* }*, i32) {
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

define i8* @series_getstr.15({ i32*, i8** }*, i32) {
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

define { i8*, i1, i32 } @series_getcard.16({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer.17({ i32*, { i8*, i32 }* }*, i32) {
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

define i32 @series_sizebool.18({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.19({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.20({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.21({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.22({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.23({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.24({ i32*, i1* }*) {
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

define i32 @series_popint.25({ i32*, i32* }*) {
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

define double @series_popfloat.26({ i32*, double* }*) {
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

define i8* @series_popstr.27({ i32*, i8** }*) {
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

define { i8*, i1, i32 } @series_popcard.28({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer.29({ i32*, { i8*, i32 }* }*) {
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
  %currvalue = alloca i32
  %card = alloca { i8*, i1, i32 }
  %new_series_ptr = alloca { i32*, { i8*, i1, i32 }* }
  %series_size_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr, i32 0, i32 0
  %series_size = alloca i32
  store i32 0, i32* %series_size
  store i32* %series_size, i32** %series_size_ptr
  %series = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr, i32 0, i32 1
  %p = alloca { i8*, i1, i32 }, i32 1028
  store { i8*, i1, i32 }* %p, { i8*, i1, i32 }** %series
  %cardcall = call { i8*, i1, i32 } @cardcall(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.59, i32 0, i32 0), i1 true, i32 5)
  call void @series_pushcard.39({ i32*, { i8*, i1, i32 }* }* %new_series_ptr, { i8*, i1, i32 } %cardcall)
  %new_series = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %new_series_ptr
  store { i32*, { i8*, i1, i32 }* } %new_series, { i32*, { i8*, i1, i32 }* }* @deck
  call void @INTRO()
  %deck = load { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* @deck
  %CREATEDECK_result = call { i32*, { i8*, i1, i32 }* } @CREATEDECK({ i32*, { i8*, i1, i32 }* } %deck)
  store { i32*, { i8*, i1, i32 }* } %CREATEDECK_result, { i32*, { i8*, i1, i32 }* }* @deck
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @str.60, i32 0, i32 0))
  %series_size1 = call i32 @series_sizecard.51({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp = sub i32 %series_size1, 1
  %series_get = call { i8*, i1, i32 } @series_getcard.45({ i32*, { i8*, i1, i32 }* }* @deck, i32 %tmp)
  store { i8*, i1, i32 } %series_get, { i8*, i1, i32 }* %card
  store i32 0, i32* @score
  %card2 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardvalue = call i32 @getcardvalue({ i8*, i1, i32 } %card2)
  store i32 %getcardvalue, i32* %currvalue
  %card3 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype = call i8* @getcardtype({ i8*, i1, i32 } %card3)
  %printf4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype)
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @str.61, i32 0, i32 0))
  %score = load i32, i32* @score
  %currvalue6 = load i32, i32* %currvalue
  %tmp7 = add i32 %score, %currvalue6
  store i32 %tmp7, i32* @score
  %score8 = load i32, i32* @score
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.1, i32 0, i32 0), i32 %score8)
  %series_pop = call { i8*, i1, i32 } @series_popcard.57({ i32*, { i8*, i1, i32 }* }* @deck)
  %printf10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @str.62, i32 0, i32 0))
  %series_size11 = call i32 @series_sizecard.51({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp12 = sub i32 %series_size11, 1
  %series_get13 = call { i8*, i1, i32 } @series_getcard.45({ i32*, { i8*, i1, i32 }* }* @deck, i32 %tmp12)
  store { i8*, i1, i32 } %series_get13, { i8*, i1, i32 }* %card
  %card14 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype15 = call i8* @getcardtype({ i8*, i1, i32 } %card14)
  %printf16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype15)
  %series_pop17 = call { i8*, i1, i32 } @series_popcard.57({ i32*, { i8*, i1, i32 }* }* @deck)
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* getelementptr inbounds ([74 x i8], [74 x i8]* @str.63, i32 0, i32 0))
  store i32 0, i32* @i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i25 = load i32, i32* @i
  %series_size26 = call i32 @series_sizecard.51({ i32*, { i8*, i1, i32 }* }* @deck)
  %tmp27 = icmp slt i32 %i25, %series_size26
  br i1 %tmp27, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i = load i32, i32* @i
  %series_get19 = call { i8*, i1, i32 } @series_getcard.45({ i32*, { i8*, i1, i32 }* }* @deck, i32 %i)
  store { i8*, i1, i32 } %series_get19, { i8*, i1, i32 }* %card
  %card20 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %card
  %getcardtype21 = call i8* @getcardtype({ i8*, i1, i32 } %card20)
  %printf22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0), i8* %getcardtype21)
  %i23 = load i32, i32* @i
  %tmp24 = add i32 %i23, 1
  store i32 %tmp24, i32* @i
  br label %while

merge:                                            ; preds = %while
  ret i32 0
}

define void @series_pushbool.35({ i32*, i1* }*, i1) {
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

define void @series_pushint.36({ i32*, i32* }*, i32) {
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

define void @series_pushfloat.37({ i32*, double* }*, double) {
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

define void @series_pushstr.38({ i32*, i8** }*, i8*) {
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

define void @series_pushcard.39({ i32*, { i8*, i1, i32 }* }*, { i8*, i1, i32 }) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %val_alloc = alloca { i8*, i1, i32 }
  store { i8*, i1, i32 } %1, { i8*, i1, i32 }* %val_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_load_2 = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_load_2, i32 %series_size
  %next_size = add i32 %series_size, 1
  store i32 %next_size, i32* %series_size_ptr
  %val = load { i8*, i1, i32 }, { i8*, i1, i32 }* %val_alloc
  store { i8*, i1, i32 } %val, { i8*, i1, i32 }* %series_next_el_ptr
  ret void
}

define void @series_pushplayer.40({ i32*, { i8*, i32 }* }*, { i8*, i32 }) {
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

define i1 @series_getbool.41({ i32*, i1* }*, i32) {
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

define i32 @series_getint.42({ i32*, i32* }*, i32) {
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

define double @series_getfloat.43({ i32*, double* }*, i32) {
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

define i8* @series_getstr.44({ i32*, i8** }*, i32) {
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

define { i8*, i1, i32 } @series_getcard.45({ i32*, { i8*, i1, i32 }* }*, i32) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_ptr_2 = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %array_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_ptr_2
  %idx_load = load i32, i32* %idx_alloc
  %series_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %array_load, i32 %idx_load
  %series_el_ptr1 = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_el_ptr
  ret { i8*, i1, i32 } %series_el_ptr1
}

define { i8*, i32 } @series_getplayer.46({ i32*, { i8*, i32 }* }*, i32) {
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

define i32 @series_sizebool.47({ i32*, i1* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %series_ptr_alloc
  %series_load = load { i32*, i1* }*, { i32*, i1* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeint.48({ i32*, i32* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %series_ptr_alloc
  %series_load = load { i32*, i32* }*, { i32*, i32* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizefloat.49({ i32*, double* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %series_ptr_alloc
  %series_load = load { i32*, double* }*, { i32*, double* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizestr.50({ i32*, i8** }*) {
entry:
  %series_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %series_ptr_alloc
  %series_load = load { i32*, i8** }*, { i32*, i8** }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizecard.51({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i32 @series_sizeplayer.52({ i32*, { i8*, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i32 }* }*
  store { i32*, { i8*, i32 }* }* %0, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i32 }* }*, { i32*, { i8*, i32 }* }** %series_ptr_alloc
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i32 }* }, { i32*, { i8*, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  ret i32 %series_size
}

define i1 @series_popbool.53({ i32*, i1* }*) {
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

define i32 @series_popint.54({ i32*, i32* }*) {
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

define double @series_popfloat.55({ i32*, double* }*) {
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

define i8* @series_popstr.56({ i32*, i8** }*) {
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

define { i8*, i1, i32 } @series_popcard.57({ i32*, { i8*, i1, i32 }* }*) {
entry:
  %series_ptr_alloc = alloca { i32*, { i8*, i1, i32 }* }*
  store { i32*, { i8*, i1, i32 }* }* %0, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_load = load { i32*, { i8*, i1, i32 }* }*, { i32*, { i8*, i1, i32 }* }** %series_ptr_alloc
  %series_arr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 1
  %series_arr_load = load { i8*, i1, i32 }*, { i8*, i1, i32 }** %series_arr_ptr
  %series_size_ptr_ptr = getelementptr inbounds { i32*, { i8*, i1, i32 }* }, { i32*, { i8*, i1, i32 }* }* %series_load, i32 0, i32 0
  %series_size_ptr = load i32*, i32** %series_size_ptr_ptr
  %series_size = load i32, i32* %series_size_ptr
  %dec_size = sub i32 %series_size, 1
  %series_next_el_ptr = getelementptr { i8*, i1, i32 }, { i8*, i1, i32 }* %series_arr_load, i32 %dec_size
  %series_arry_next_element = load { i8*, i1, i32 }, { i8*, i1, i32 }* %series_next_el_ptr
  store i32 %dec_size, i32* %series_size_ptr
  ret { i8*, i1, i32 } %series_arry_next_element
}

define { i8*, i32 } @series_popplayer.58({ i32*, { i8*, i32 }* }*) {
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
