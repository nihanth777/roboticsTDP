function ph = phicalculate(X1,Y1,X2,Y2)
       
      if X2-X1 >= 0
        ph = atan((Y2-Y1)/(X2-X1));
      else
        if Y2-Y1 >=0
            ph = pi+atan((Y2-Y1)/(X2-X1));
        else
            ph = -pi+atan((Y2-Y1)/(X2-X1));
        end
      end
end
