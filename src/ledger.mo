// ryjl3-tyaaa-aaaaa-aaaba-cai
// This is a generated Motoko binding.
// Please use `import service "ic:canister_id"` instead to call canisters on the IC if possible.

module {
  public type AccountBalanceArgs = { account : AccountIdentifier };
  public type AccountIdentifier = Text;
  public type ArchiveOptions = {
    max_message_size_bytes : ?Nat32;
    node_max_memory_size_bytes : ?Nat32;
    controller_id : Principal;
  };
  public type BlockHeight = Nat64;
  public type CanisterId = Principal;
  public type Duration = { secs : Nat64; nanos : Nat32 };
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
  public type LedgerCanisterInitPayload = {
    send_whitelist : [{ _0_  : Principal }];
    minting_account : AccountIdentifier;
    transaction_window : ?Duration;
    max_message_size_bytes : ?Nat32;
    archive_options : ?ArchiveOptions;
    initial_values : [(AccountIdentifier, ICPTs)];
  };
  public type Memo = Nat64;
  public type NotifyCanisterArgs = {
    to_subaccount : ?SubAccount;
    from_subaccount : ?SubAccount;
    to_canister : Principal;
    max_fee : ICPTs;
    block_height : BlockHeight;
  };
  public type SendArgs = {
    to : AccountIdentifier;
    fee : ICPTs;
    memo : Memo;
    from_subaccount : ?SubAccount;
    created_at_time : ?TimeStamp;
    amount : ICPTs;
  };
  public type SubAccount = [Nat8];
  public type TimeStamp = { timestamp_nanos : Nat64 };
  public type Transaction = {
    memo : Memo;
    created_at : BlockHeight;
    transfer : Transfer;
  };
  public type Transfer = {
    #Burn : { from : AccountIdentifier; amount : ICPTs };
    #Mint : { to : AccountIdentifier; amount : ICPTs };
    #Send : {
      to : AccountIdentifier;
      from : AccountIdentifier;
      amount : ICPTs;
    };
  };
  public type Self = LedgerCanisterInitPayload -> async actor {
    account_balance_dfx : shared query AccountBalanceArgs -> async ICPTs;
    get_nodes : shared query () -> async [CanisterId];
    http_request : shared query HttpRequest -> async HttpResponse;
    notify_dfx : shared NotifyCanisterArgs -> async ();
    send_dfx : shared SendArgs -> async BlockHeight;
  }
}