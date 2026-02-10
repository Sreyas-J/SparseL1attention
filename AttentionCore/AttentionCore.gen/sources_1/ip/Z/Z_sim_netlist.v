// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Feb 10 21:39:32 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sk/Desktop/SparseL1Attention/AttentionCore/AttentionCore.gen/sources_1/ip/Z/Z_sim_netlist.v
// Design      : Z
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Z,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Z
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [1:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [1:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [1:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "2" *) 
  (* C_ADDRB_WIDTH = "2" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "Z.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4" *) 
  (* C_READ_DEPTH_B = "4" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4" *) 
  (* C_WRITE_DEPTH_B = "4" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Z_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[1:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[1:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19184)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
