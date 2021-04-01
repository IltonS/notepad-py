def isSquareNumber(n):
    if n<1:
       return False
    
    i = 1
    while n>=(i*i):
       if n == (i*i):
          return True
       i += 1   
    
    return False
# ------------------------------------------------------------------------------     

 