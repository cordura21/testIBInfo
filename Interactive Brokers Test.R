# First Download IB Gateway app. Install and Run
# https://www.interactivebrokers.com/en/index.php?f=16457
#
# user edemo, password demouser
#
# install IBrokers package
#
library(IBrokers)
# Create connection
conn <- ibgConnect()
isConnected(conn)

# Request an Update
account_update <- NULL
account_update <- reqAccountUpdates(conn)       # this will return a AccountUpdate object

# This is a strange object
class(account_update)

# First object has general information on the account
# Some values that I find useful
initial.margin <- as.numeric(account_update[[1]]$FullInitMarginReq[1])
maintenance.margin <- as.numeric(account_update[[1]]$FullMaintMarginReq[1])
RealizedPnL <-  as.numeric(account_update[[1]]$RealizedPnL[1])
UnrealizedPnL <-  as.numeric(account_update[[1]]$UnrealizedPnL[1])

# Close Connection
twsDisconnect(conn)
