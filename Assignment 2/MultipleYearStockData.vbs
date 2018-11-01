Sub stockData()
    For Each Ws In Worksheets
    
    
        Dim ticker As String
        Dim lastRow As Long
        Dim tVol As Double
        Dim count As Long
        Dim amountOne As Long
        Dim yrChange As Double
        Dim yrOpen As Double
        Dim yrClose As Double
        Dim pcntChange As Double
        Dim incVal As Double
        Dim decVal As Double
        Dim lastRowTwo As Long
        Dim gstVal As Double
        
        tVol = 0
        count = 2
        incVal = 0
        decVal = 0
        gstVal = 0
        amountOne = 2
        
        Ws.Range("I1").Value = "Ticker"
        Ws.Range("L1").Value = "Total Stock Volume"
        Ws.Range("J1").Value = "Yearly Change"
        Ws.Range("K1").Value = "Percent Change"
        Ws.Range("P1").Value = "Ticker"
        Ws.Range("Q1").Value = "Value"
        Ws.Range("O2").Value = "Greatest % Increase"
        Ws.Range("O3").Value = "Greatest % Decrease"
        Ws.Range("O4").Value = "Greatest Total Volume"
        
     
             
        tVol = 0
        count = 2
        incVal = 0
        decVal = 0
        gstVal = 0
        amountOne = 2
        
        lastRow = Ws.Cells(Rows.count, 1).End(xlUp).Row
        For i = 2 To lastRow
            
            tVol = tVol + Ws.Cells(i, 7).Value
            
            If Ws.Cells(i + 1, 1).Value <> Ws.Cells(i, 1).Value Then
            ticker = Ws.Cells(i, 1).Value
                    
            'Getting ticker symbol
            Ws.Range("I" & count).Value = ticker
            
            'Calculating total stock volume
            Ws.Range("L" & count).Value = tVol
            tVol = 0
            
            'Calculating yearly change
            yrOpen = Ws.Range("C" & amountOne)
            yrClose = Ws.Range("F" & i)
            yrChange = yrClose - yrOpen
            Ws.Range("J" & count).Value = yrChange
            
            'Calculating percent change
            If yrOpen = 0 Then
                pcntChange = 0
            Else
                yrOpen = Ws.Range("C" & amountOne)
                pcntChange = yrChange / yrOpen
            End If
            Ws.Range("K" & count).NumberFormat = "0.00%"
            Ws.Range("K" & count).Value = pcntChange
            
            'Conditionally highlighting positive and negative changes
                If Ws.Range("J" & count).Value >= 0 Then
                    Ws.Range("J" & count).Interior.ColorIndex = 4
                Else
                    Ws.Range("J" & count).Interior.ColorIndex = 3
                End If
            
            amountOne = i + 1
            count = count + 1
            End If
        Next i
        
        'Finding the greatest value
        lastRowTwo = Ws.Cells(Rows.count, 11).End(xlUp).Row
        Ws.Range("Q2").NumberFormat = "0.00%"
        Ws.Range("Q3").NumberFormat = "0.00%"
        
        For j = 2 To lastRowTwo
            If Ws.Range("K" & j).Value > incVal Then
                incVal = Ws.Range("K" & j).Value
                Ws.Range("Q2").Value = incVal
                Ws.Range("P2").Value = Ws.Range("I" & j).Value
            End If
            If Ws.Range("K" & j).Value < decVal Then
                decVal = Ws.Range("K" & j).Value
                Ws.Range("Q3").Value = decVal
                Ws.Range("P3").Value = Ws.Range("I" & j).Value
            End If
            If Ws.Range("L" & j).Value > gstVal Then
                gstVal = Ws.Range("L" & j).Value
                Ws.Range("Q4").Value = gstVal
                Ws.Range("P4").Value = Ws.Range("I" & j).Value
            End If
        Next j

    Next Ws
End Sub