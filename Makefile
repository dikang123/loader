TARGET = loader
SRCS = $(TARGET).cpp
OBJS = $(TARGET).o
CXX = g++
CFLAGS = -c -Wall -O2 -fno-rtti -fno-exceptions
CXXFLAGS = 
DEBUG = 
LFLAGS = -Wall
MYSQL_BASEDIR = /usr/local/mysql
INCLUDE_DIR = $(MYSQL_BASEDIR)/include/ 
LIB_DIR = -L$(MYSQL_BASEDIR)/lib 
SYS_LIB = 

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(LFLAGS) $(LIB_DIR) $(OBJS) -lmysqlclient_r $(SYS_LIB) -o $(TARGET)

$(TARGET).o: $(SRCS)
	$(CXX) $(CFLAGS) -I$(MYSQL_BASEDIR)/include -I$(TOP_SRCDIR)/include/mysql -I$(INCLUDE_DIR)  $(SRCS)

clean:
	rm -f *.o $(TARGET)

