// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Sat Jan 31 15:22:47 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Q_sim_netlist.v
// Design      : Q
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Q,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19328)
`pragma protect data_block
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
AQvmiXI=
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
