// qoctq-giaaa-aaaaa-aaaea-cai
// This is a generated Motoko binding.
// Please use `import service "ic:canister_id"` instead to call canisters on the IC if possible.

module {
  public type AccountDetails = {
    account_identifier : AccountIdentifier;
    hardware_wallet_accounts : [HardwareWalletAccountDetails];
    sub_accounts : [SubAccountDetails];
  };
  public type AccountIdentifier = Text;
  public type AttachCanisterRequest = { name : Text; canister_id : Principal };
  public type AttachCanisterResponse = {
    #Ok;
    #CanisterAlreadyAttached;
    #NameAlreadyTaken;
    #NameTooLong;
    #CanisterLimitExceeded;
  };
  public type BlockHeight = Nat64;
  public type CanisterDetails = { name : Text; canister_id : Principal };
  public type CreateSubAccountResponse = {
    #Ok : SubAccountDetails;
    #AccountNotFound;
    #NameTooLong;
    #SubAccountLimitExceeded;
  };
  public type DetachCanisterRequest = { canister_id : Principal };
  public type DetachCanisterResponse = { #Ok; #CanisterNotFound };
  public type GetAccountResponse = { #Ok : AccountDetails; #AccountNotFound };
  public type GetTransactionsRequest = {
    page_size : Nat8;
    offset : Nat32;
    account_identifier : AccountIdentifier;
  };
  public type GetTransactionsResponse = {
    total : Nat32;
    transactions : [Transaction];
  };
  public type HardwareWalletAccountDetails = {
    name : Text;
    account_identifier : AccountIdentifier;
  };
  public type HeaderField = (Text, Text);
  public type HttpRequest = {
    url : Text;
    method : Text;
    body : [Nat8];
    headers : [HeaderField];
  };
  public type HttpResponse = {
    body : [Nat8];
    headers : [HeaderField];
    status_code : Nat16;
  };
  public type ICPTs = { e8s : Nat64 };
  public type Receive = {
    fee : ICPTs;
    from : AccountIdentifier;
    amount : ICPTs;
  };
  public type RegisterHardwareWalletRequest = {
    name : Text;
    account_identifier : AccountIdentifier;
  };
  public type RegisterHardwareWalletResponse = {
    #Ok;
    #AccountNotFound;
    #HardwareWalletAlreadyRegistered;
    #HardwareWalletLimitExceeded;
    #NameTooLong;
  };
  public type RemoveHardwareWalletRequest = {
    account_identifier : AccountIdentifier;
  };
  public type RemoveHardwareWalletResponse = { #Ok; #HardwareWalletNotFound };
  public type RenameSubAccountRequest = {
    new_name : Text;
    account_identifier : AccountIdentifier;
  };
  public type RenameSubAccountResponse = {
    #Ok;
    #AccountNotFound;
    #SubAccountNotFound;
    #NameTooLong;
  };
  public type Send = { to : AccountIdentifier; fee : ICPTs; amount : ICPTs };
  public type Stats = {
    latest_transaction_block_height : BlockHeight;
    seconds_since_last_ledger_sync : Nat64;
    sub_accounts_count : Nat64;
    hardware_wallet_accounts_count : Nat64;
    accounts_count : Nat64;
    earliest_transaction_block_height : BlockHeight;
    transactions_count : Nat64;
    block_height_synced_up_to : ?Nat64;
    latest_transaction_timestamp_nanos : Nat64;
    earliest_transaction_timestamp_nanos : Nat64;
  };
  public type SubAccount = [Nat8];
  public type SubAccountDetails = {
    name : Text;
    sub_account : SubAccount;
    account_identifier : AccountIdentifier;
  };
  public type Timestamp = { timestamp_nanos : Nat64 };
  public type Transaction = {
    memo : Nat64;
    timestamp : Timestamp;
    block_height : BlockHeight;
    transfer : Transfer;
  };
  public type Transfer = {
    #Burn : { amount : ICPTs };
    #Mint : { amount : ICPTs };
    #Send : Send;
    #Receive : Receive;
  };
  public type Self = actor {
    add_account : shared () -> async AccountIdentifier;
    attach_canister : shared AttachCanisterRequest -> async AttachCanisterResponse;
    create_sub_account : shared Text -> async CreateSubAccountResponse;
    detach_canister : shared DetachCanisterRequest -> async DetachCanisterResponse;
    get_account : shared query () -> async GetAccountResponse;
    get_canisters : shared query () -> async [CanisterDetails];
    get_icp_to_cycles_conversion_rate : shared query () -> async Nat64;
    get_stats : shared query () -> async Stats;
    get_transactions : shared query GetTransactionsRequest -> async GetTransactionsResponse;
    http_request : shared query HttpRequest -> async HttpResponse;
    register_hardware_wallet : shared RegisterHardwareWalletRequest -> async RegisterHardwareWalletResponse;
    remove_hardware_wallet : shared RemoveHardwareWalletRequest -> async RemoveHardwareWalletResponse;
    rename_sub_account : shared RenameSubAccountRequest -> async RenameSubAccountResponse;
  }
}