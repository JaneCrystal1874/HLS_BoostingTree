-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dzI_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_dzI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 3=> "0", 4 => "1", 5 => "0", 6 => "1", 7 => "0", 
    8 => "1", 9 => "0", 10 to 11=> "1", 12 => "0", 13 => "1", 14 => "0", 15 => "1", 
    16 => "0", 17 => "1", 18 to 19=> "0", 20 => "1", 21 to 23=> "0", 24 => "1", 25 to 27=> "0", 
    28 => "1", 29 => "0", 30 => "1", 31 to 32=> "0", 33 to 37=> "1", 38 => "0", 39 => "1", 
    40 => "0", 41 => "1", 42 => "0", 43 => "1", 44 => "0", 45 => "1", 46 to 49=> "0", 
    50 => "1", 51 => "0", 52 to 53=> "1", 54 => "0", 55 => "1", 56 to 58=> "0", 59 => "1", 
    60 => "0", 61 => "1", 62 to 63=> "0", 64 to 66=> "1", 67 to 68=> "0", 69 => "1", 70 => "0", 
    71 => "1", 72 to 73=> "0", 74 to 76=> "1", 77 => "0", 78 => "1", 79 to 82=> "0", 83 => "1", 
    84 to 86=> "0", 87 to 90=> "1", 91 => "0", 92 => "1", 93 => "0", 94 to 95=> "1", 96 => "0", 
    97 to 99=> "1", 100 => "0", 101 to 102=> "1", 103 => "0", 104 => "1", 105 => "0", 106 => "1", 
    107 => "0", 108 => "1", 109 => "0", 110 => "1", 111 => "0", 112 => "1", 113 => "0", 
    114 => "1", 115 to 117=> "0", 118 to 122=> "1", 123 to 125=> "0", 126 => "1", 127 => "0", 128 => "1", 
    129 => "0", 130 to 132=> "1", 133 => "0", 134 => "1", 135 => "0", 136 => "1", 137 => "0", 
    138 => "1", 139 to 141=> "0", 142 to 144=> "1", 145 to 147=> "0", 148 => "1", 149 to 150=> "0", 151 to 152=> "1", 
    153 to 154=> "0", 155 => "1", 156 to 157=> "0", 158 => "1", 159 => "0", 160 to 162=> "1", 163 to 164=> "0", 
    165 to 166=> "1", 167 => "0", 168 to 170=> "1", 171 to 172=> "0", 173 => "1", 174 => "0", 175 to 178=> "1", 
    179 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_dzI is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_dzI is
    component predict_ensemble_dzI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dzI_rom_U :  component predict_ensemble_dzI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


