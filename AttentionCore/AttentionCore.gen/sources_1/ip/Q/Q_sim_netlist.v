// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 15:22:47 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top Q -prefix
//               Q_ Q_sim_netlist.v
// Design      : Q
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Q,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module Q
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
  (* C_INIT_FILE = "Q.mem" *) 
  (* C_INIT_FILE_NAME = "Q.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
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
  Q_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18880)
`pragma protect data_block
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
D3RAXXUhGqYyEoQfIA==
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
