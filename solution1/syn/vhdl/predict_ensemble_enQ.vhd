-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_enQ_rom is 
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


architecture rtl of predict_ensemble_enQ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 6=> "1", 7 => "0", 8 => "1", 9 => "0", 
    10 => "1", 11 to 17=> "0", 18 to 20=> "1", 21 to 22=> "0", 23 to 28=> "1", 29 to 30=> "0", 31 => "1", 
    32 => "0", 33 => "1", 34 => "0", 35 to 36=> "1", 37 to 38=> "0", 39 => "1", 40 => "0", 
    41 => "1", 42 to 45=> "0", 46 to 47=> "1", 48 => "0", 49 to 50=> "1", 51 to 56=> "0", 57 to 63=> "1", 
    64 => "0", 65 => "1", 66 => "0", 67 to 68=> "1", 69 to 70=> "0", 71 => "1", 72 => "0", 
    73 => "1", 74 => "0", 75 => "1", 76 => "0", 77 => "1", 78 to 80=> "0", 81 => "1", 
    82 => "0", 83 to 84=> "1", 85 => "0", 86 => "1", 87 to 88=> "0", 89 => "1", 90 => "0", 
    91 => "1", 92 to 93=> "0", 94 to 98=> "1", 99 to 101=> "0", 102 to 105=> "1", 106 => "0", 107 => "1", 
    108 => "0", 109 => "1", 110 => "0", 111 => "1", 112 => "0", 113 => "1", 114 to 117=> "0", 
    118 to 119=> "1", 120 => "0", 121 => "1", 122 => "0", 123 to 125=> "1", 126 to 128=> "0", 129 to 130=> "1", 
    131 to 133=> "0", 134 => "1", 135 to 136=> "0", 137 to 138=> "1", 139 => "0", 140 => "1", 141 => "0", 
    142 to 144=> "1", 145 to 146=> "0", 147 to 148=> "1", 149 to 151=> "0", 152 to 153=> "1", 154 => "0", 155 to 156=> "1", 
    157 => "0", 158 => "1", 159 to 160=> "0", 161 => "1", 162 => "0", 163 to 164=> "1", 165 to 166=> "0", 
    167 to 170=> "1", 171 to 194=> "0" );

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

entity predict_ensemble_enQ is
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

architecture arch of predict_ensemble_enQ is
    component predict_ensemble_enQ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_enQ_rom_U :  component predict_ensemble_enQ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


