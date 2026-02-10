// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Feb 10 21:39:32 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Z_sim_netlist.v
// Design      : Z
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Z,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
5rlwN/8=
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
