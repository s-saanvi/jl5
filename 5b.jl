function getNextWord(inn::IOStream) 
    ch = ' '
    while !eof(inn) && !isletter(ch)
        ch = read(inn, Char)
    end
    if eof(inn) return nothing end
        wrd = string(ch)
        ch = read(inn, Char)
        while isletter(ch)
            wrd *= ch
            ch = read(inn, Char)
        end
    return wrd
end
function testGetWord()
    inn = open("5bin.txt", "r")
    wrd = getNextWord(inn)
    while wrd != nothing
        print(wrd, " ")
        wrd = getNextWord(inn)
    end
    close(inn)
end
testGetWord()