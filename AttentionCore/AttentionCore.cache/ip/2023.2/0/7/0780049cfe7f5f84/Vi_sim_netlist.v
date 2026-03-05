// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Tue Mar  3 23:50:21 2026
// Host        : sk-Standard-PC-Q35-ICH9-2009 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Vi_sim_netlist.v
// Design      : Vi
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Vi,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [0:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [1:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [1:0]douta;

  wire [0:0]addra;
  wire clka;
  wire [1:0]dina;
  wire [1:0]douta;
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
  wire [1:0]NLW_U0_doutb_UNCONNECTED;
  wire [0:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "1" *) 
  (* C_ADDRB_WIDTH = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.205164 mW" *) 
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
  (* C_INIT_FILE = "Vi.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2" *) 
  (* C_READ_DEPTH_B = "2" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "2" *) 
  (* C_READ_WIDTH_B = "2" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "2" *) 
  (* C_WRITE_DEPTH_B = "2" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "2" *) 
  (* C_WRITE_WIDTH_B = "2" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(1'b0),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[1:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[1:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20624)
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
